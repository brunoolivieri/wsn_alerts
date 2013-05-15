

#include "RadioToLeds.h"

module RadioToLedsC {
  uses interface Boot;
  uses interface Leds;
  uses interface Receive;
  uses interface SplitControl as AMControl;
  


  // adicionei aqui:

  uses interface Timer<TMilli>;
  uses interface Read<uint16_t>;
  uses interface Packet;
  uses interface AMSend;




}

implementation {

  uint16_t data;
  bool busy = FALSE;
  message_t packet;


  task void setLeds() {
    if (data > 700)
      call Leds.led0On();
    else 
      call Leds.led0Off();
    if (data > 500)
      call Leds.led1On();
    else
      call Leds.led1Off();
    if (data > 300)
      call Leds.led2On();
    else
      call Leds.led2Off();
  }

  event void Boot.booted() {
    call AMControl.start();
  }

  event void AMControl.startDone(error_t err) {
    // if (err != SUCCESS) { call AMControl.start(); }
	
    // troquei um pelo outro aqui.
    if (err == SUCCESS) 
      call Timer.startPeriodic(5000);
    else 
      call AMControl.start();



  }

  event void AMControl.stopDone(error_t err) { }

   // adicionado
  event void Read.readDone(error_t result, uint16_t data) {

	post setLeds();

  }

// adicionado
  event void AMSend.sendDone(message_t* msg, error_t err) {
    if (&packet == msg) {
      busy = FALSE;
      call Leds.led2Toggle();
    }
  }



  event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
    if (len == sizeof(Msg)) {
      Msg* localpkt = (Msg*)payload;
      if (post setLeds() == SUCCESS) {
         data = localpkt->data;
      }
    }
    busy = FALSE;
    return msg;
  }

  // adicionado tem que mandar uma msg pedindo os LEDs
  event void Timer.fired() {
    
    if (!busy) {
      Msg* localpkt = (Msg*) (call Packet.getPayload(&packet, sizeof(Msg)));
      if (localpkt == NULL) { return; }
      localpkt->data = data;
      if (call AMSend.send(AM_BROADCAST_ADDR, &packet, sizeof(Msg)) == SUCCESS) {
        busy = TRUE;
      }
      //call Leds.led1Toggle();
    }


     
  }






}
