#include "simpleCS.h"

configuration clientAppC{
}
implementation{
	components clientC, MainC, LedsC;
	components new TimerMilliC() as periodicTimer;
	components new TimerMilliC() as Timeout;
	components new TimerMilliC() as flashTimer;
	components ActiveMessageC;
	components new AMSenderC(REQUEST_ID) as sendRequest;
	components new AMReceiverC(RETURN_ID) as recReturn;
	
	clientC.Boot -> MainC;
	clientC.Leds -> LedsC;
	clientC.periodicTimer -> periodicTimer;
	clientC.Timeout -> Timeout;
	clientC.flashTimer -> flashTimer;
	clientC.RadioControl -> ActiveMessageC;
	clientC.sendRequest -> sendRequest;
	clientC.recReturn -> recReturn;
	
}