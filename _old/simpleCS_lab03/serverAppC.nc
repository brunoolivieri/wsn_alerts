

#include <Timer.h>
#include "simpleCS.h"



configuration serverAppC { }
implementation {
  components MainC, LedsC, serverC as App, new TimerMilliC();
  components new PhotoC() as SensorPhoto;
  components new TempC() as SensorTemp;
  components ActiveMessageC;
  components new AMSenderC(AM_RETURNMSG);
  components new AMReceiverC(AM_REQUESTMSG); // esse cara é um dispach 

  App.Boot -> MainC;
  App.Leds -> LedsC;
  App.ReadTemp -> SensorTemp;
  App.ReadPhoto -> SensorPhoto;
  App.Packet -> AMSenderC;
  App.AMControl -> ActiveMessageC;
  App.AMSend -> AMSenderC;
  App.Receive -> AMReceiverC;

 



}

