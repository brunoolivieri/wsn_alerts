

#include <Timer.h>
//#include "simpleCS.h"



configuration alarmGroupAppC { }
implementation {
  components MainC, alarmGroupC as App; //, new TimerMilliC(); //, LedsC, serverC as App, 
  components new TimerMilliC() as Timer0;



//  components new PhotoC() as SensorPhoto;
//  components new TempC() as SensorTemp;
//  components ActiveMessageC;
//  components new AMSenderC(AM_RETURNMSG);
//  components new AMReceiverC(AM_REQUESTMSG); // esse cara é um dispach 

  App.Boot -> MainC;
  App.Timer0 -> Timer0;


/*  App.Leds -> LedsC;
  App.ReadTemp -> SensorTemp;
  App.ReadPhoto -> SensorPhoto;
  App.Packet -> AMSenderC;
  App.AMControl -> ActiveMessageC;
  App.AMSend -> AMSenderC;
  App.Receive -> AMReceiverC;
*/
 
}

