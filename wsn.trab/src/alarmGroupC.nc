

#include <Timer.h>
//#include "simpleCS.h"

module alarmGroupC {
  uses interface Boot;
  uses interface Timer<TMilli> as Timer0;

/*  uses interface Leds;
  uses interface Read<uint16_t> as ReadTemp;
  uses interface Read<uint16_t> as ReadPhoto;
  uses interface Packet;
  uses interface AMSend;
  uses interface SplitControl as AMControl;
  uses interface Receive;
*/}

implementation {
//  message_t packet;
//  requestMsg_t packet_in;
  
  bool is_coord = FALSE;
  int my_group, i = 0;
  int looptime = 100000;
  bool active_childs[9];

  

  event void Boot.booted() {

    my_group = TOS_NODE_ID / 10 ;

    if ((TOS_NODE_ID % 10) == 0)  {
	is_coord = TRUE;
        dbg("basico", "COORDENADOR id %d, é do grupo %d.\n", TOS_NODE_ID, my_group);   
    } else {
	is_coord = FALSE;
        dbg("basico", "LEITOR id %d, é do grupo %d.\n", TOS_NODE_ID, my_group);     
    };

   call Timer0.startPeriodic(looptime);

   for (i=1; i < 10; i++) {
     active_childs[i] = FALSE;
   }
   

    //call AMControl.start();
    //call Leds.led0On();
    
  }


  event void Timer0.fired() {
   
    if ( is_coord)  {
	dbg("basico", "COORDENADOR id %d, do grupo %d vivo e rodando.\n", TOS_NODE_ID, my_group);   
    } else {
	dbg("basico", "LEITOR id %d, do grupo %d vivo e rodando.\n", TOS_NODE_ID, my_group);     
    };



  }




}









/*
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
           
     
      if (call AMSend.send(packet_in.ClientID, &packet, sizeof(returnMsg_t)) == SUCCESS) { 
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
           
     
      if (call AMSend.send(packet_in.ClientID, &packet, sizeof(returnMsg_t)) == SUCCESS) {  
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
      memcpy((void*)&packet_in, payload, sizeof(requestMsg_t)); 
    
 	   if packet_in.SensorType == TEMP {
	     call ReadTemp.read();
	   }
	   else {
	     call ReadPhoto.read();
	   }   
    }
    return msg;
   
  }

*/
