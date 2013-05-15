#include "simpleCS.h"

module clientC{

	uses interface Boot;
	uses interface Leds;
	uses interface Timer<TMilli> as periodicTimer;
	uses interface Timer<TMilli> as Timeout;
	uses interface Timer<TMilli> as flashTimer;

	uses {
		interface SplitControl as RadioControl;
		interface AMSend as sendRequest;
		interface Receive as recReturn;
		}
}
implementation{
	
	uint16_t reqCount = 0;
	bool sendBusy = FALSE;
	message_t sendBuff;
	

	event void Boot.booted(){
		dbg("clientC","Boot.booted()\n");
		call RadioControl.start();
	}

	event void RadioControl.stopDone(error_t error){}
	event void RadioControl.startDone(error_t error){
		dbg("clientC","RadioControl.startDone()\n");
		call periodicTimer.startPeriodic(TIMER_PERIOD);
	}

	event void periodicTimer.fired(){
		requestMsg_t Data;
		dbg("clientC","periodicTimer.fired(): sendBusy=%s\n",((sendBusy)?"TRUE":"FALSE"));
		if (sendBusy) return;
		reqCount++;
		sendBusy = TRUE;
		// Build a msg buffer
		Data.MsgType = REQUEST_ID;
		Data.ClientID = TOS_NODE_ID;
		Data.ServerID = SERVER_ID;
		Data.SensorType = SENSOR;
		Data.Seq = reqCount;
		memcpy(call sendRequest.getPayload(&sendBuff,call sendRequest.maxPayloadLength()), &Data, sizeof(requestMsg_t));
		// Try do send via radio
		call sendRequest.send(SERVER_ID, &sendBuff, sizeof(requestMsg_t));
	}

	event void sendRequest.sendDone(message_t *msg, error_t error){
		sendBusy = FALSE;
		call flashTimer.stop();
		call Timeout.startOneShot(500);
		if (error)	dbg("clientC","sendRequest.sendDone(): Error=%d\n",error);
		}

	event message_t * recReturn.receive(message_t *msg, void *payload, uint8_t len){
		returnMsg_t Data;
		memcpy(&Data,payload,sizeof(returnMsg_t));
		dbg("clientC","recReturn.receive(): Status=%d\n", Data.Status);		
		if ((Data.Seq == reqCount) && (Data.Status==SUCCESS)){
			call Timeout.stop();
			call Leds.set( (uint8_t)(Data.Value/200 & 0x07) );			
		} else {
			dbg("clientC","recReturn.receive(): Not synchonized or Error\n");
		}			
		return msg;
	}

	event void Timeout.fired(){
			call flashTimer.startPeriodic(100);
	}

	event void flashTimer.fired(){
		call Leds.led0Toggle();
	}

}