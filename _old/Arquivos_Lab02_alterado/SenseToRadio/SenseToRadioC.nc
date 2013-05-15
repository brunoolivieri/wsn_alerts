

#include <Timer.h>
#include "SenseToRadio.h"

module SenseToRadioC {
  uses interface Boot;
  uses interface Leds;
  // uses interface Timer<TMilli>;
  uses interface Read<uint16_t>;
  uses interface Packet;
  uses interface AMSend;
  uses interface SplitControl as AMControl;

  // adicionei aqui:
  uses interface Receive;
}

implementation {
  message_t packet;

  // adicionei:
  bool busy = FALSE;

  event void Boot.booted() {
    call AMControl.start();

    // adicionei esse codigo aqui
    call Leds.led0On();
    
  }

  event void AMControl.startDone(error_t err) {


    if (err != SUCCESS) { call AMControl.start(); }

  }

  event void AMControl.stopDone(error_t err) { }



  event void Read.readDone(error_t result, uint16_t data) {
    if (!busy) {
      Msg* localpkt = (Msg*) (call Packet.getPayload(&packet, sizeof(Msg)));
      if (localpkt == NULL) { return; }
      localpkt->data = data;
      if (call AMSend.send(AM_BROADCAST_ADDR, &packet, sizeof(Msg)) == SUCCESS) {
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


  // adicionei o metodo receive que deveria testar a msg  para chamar "call Read.read();"

  event message_t* Receive.receive(message_t* msg, void* payload, uint8_t len){
    if (len == sizeof(Msg)) {
      Msg* localpkt = (Msg*)payload;
      // if (post setLeds() == SUCCESS) {
      //   data = localpkt->data;
      // }
      call Read.read();
    }
    
    return msg;
  }





}
