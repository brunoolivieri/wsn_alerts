

#include "RadioToLeds.h"

configuration RadioToLedsAppC { }
implementation {
  components MainC, LedsC;
  components new TimerMilliC();
  components ActiveMessageC;
  components new AMReceiverC(AM_MSGCODE);
  components RadioToLedsC as App;




  // adicionado:
  components new AMSenderC(AM_MSGCODE);

  App.Boot -> MainC;
  App.Leds -> LedsC;
  App.AMControl -> ActiveMessageC;
  App.Receive -> AMReceiverC;

  // adicionei aqui:
  App.Timer -> TimerMilliC;	
  App.Packet -> AMSenderC;
  App.AMSend -> AMSenderC;

}
