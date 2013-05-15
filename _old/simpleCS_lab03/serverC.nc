

#include <Timer.h>
#include "simpleCS.h"

module serverC {
  uses interface Boot;
  uses interface Leds;
  uses interface Read<uint16_t> as ReadTemp;
  uses interface Read<uint16_t> as ReadPhoto;
  uses interface Packet;
  uses interface AMSend;
  uses interface SplitControl as AMControl;
  uses interface Receive;
}

implementation {
  message_t packet;
  requestMsg_t packet_in;
  
  bool busy = FALSE;

  event void Boot.booted() {
    call AMControl.start();

    call Leds.led0On();
    
  }

  event void AMControl.startDone(error_t err) {


    if (err != SUCCESS) { call AMControl.start(); }

  }

  event void AMControl.stopDone(error_t err) { }



  event void ReadTemp.readDone(error_t result, uint16_t data) {
    if (!busy) {
      returnMsg_t* localpkt = (returnMsg_t*) (call Packet.getPayload(&packet, sizeof(returnMsg_t)));
     
     
      if (localpkt == NULL) { return; }
      localpkt->MsgType = RETURN_ID;
      localpkt->Value = data;
      localpkt->ClientID = packet_in.ClientID;
      localpkt->ServerID = SERVER_ID;
      localpkt->Seq = packet_in.Seq;
      localpkt->Status = 0;
           
     
      if (call AMSend.send(packet_in.ClientID, &packet, sizeof(returnMsg_t)) == SUCCESS) {  // pq AM_REQUESTMSG????
        busy = TRUE;
      }
      
    }
  }



  event void ReadPhoto.readDone(error_t result, uint16_t data) {
    if (!busy) {
      returnMsg_t* localpkt = (returnMsg_t*) (call Packet.getPayload(&packet, sizeof(returnMsg_t)));
     
     
      if (localpkt == NULL) { return; }
      localpkt->MsgType = RETURN_ID;
      localpkt->Value = data;
      localpkt->ClientID = packet_in.ClientID;
      localpkt->ServerID = SERVER_ID;
      localpkt->Seq = packet_in.Seq;
      localpkt->Status = 0;
           
     
      if (call AMSend.send(packet_in.ClientID, &packet, sizeof(returnMsg_t)) == SUCCESS) {  // pq AM_REQUESTMSG????
        busy = TRUE;
      }
      
    }
  }



  event void AMSend.sendDone(message_t* msg, error_t err) {
    if (&packet == msg) {
      busy = FALSE;
      call Leds.led2Toggle();
    }
  }


	
  event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
    if (len == sizeof(msg)) {
      memcpy((void*)&packet_in, payload, sizeof(requestMsg_t)); // copia o que chegou para packet_in
    
 	   if packet_in.SensorType == TEMP {
	     call ReadTemp.read();
	   }
	   else {
	     call ReadPhoto.read();
	   }   
    }
    return msg;
   
  }

