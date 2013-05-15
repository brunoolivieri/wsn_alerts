

#include <Timer.h>
#include "SenseToRadio.h"

configuration SenseToRadioAppC { }
implementation {
  components MainC, LedsC, SenseToRadioC as App, new TimerMilliC();
  components new PhotoC() as Sensor;
  components ActiveMessageC;
  components new AMSenderC(AM_MSGCODE);

  // adicionei 
  components new AMReceiverC(AM_MSGCODE);

  App.Boot -> MainC;
  App.Leds -> LedsC;
  App.Read -> Sensor;
  App.Packet -> AMSenderC;
  App.AMControl -> ActiveMessageC;
  App.AMSend -> AMSenderC;


  // tirei esse aqui:
  // App.Timer -> TimerMilliC;

  // adicionei aqui:
  App.Receive -> AMReceiverC;

 



}
