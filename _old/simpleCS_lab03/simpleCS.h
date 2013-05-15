#ifndef SIMPLE_CS_H
#define SIMPLE_CS_H


enum{
	
	// AM IDs
	REQUEST_ID = 130,
	RETURN_ID =  131,

	// AM ID - mig
	AM_REQUESTMSG = REQUEST_ID,
	AM_RETURNMSG = RETURN_ID,

	// Periodic timer period (time in milliseconds)
	TIMER_PERIOD = 2000,
	
	// Sensor type definition
	TEMP = 1,
	PHOTO = 2,


// Selected sensor
#ifndef SEL_SENSOR
	SENSOR = PHOTO,
#endif

// Selected server
#ifndef SERVER_ID
	SERVER_ID = 10,
#endif

	
};

// Request message structure
typedef nx_struct requestMsg {
	nx_uint8_t MsgType;		// Message type identifier
	nx_uint16_t ClientID;	// Client mote identifier
	nx_uint16_t ServerID;	// Server mote identifier
	nx_uint16_t Seq;		// Request sequence
	nx_uint8_t SensorType;	// Sensor type ID
} requestMsg_t;

// Return message structure
typedef nx_struct returnMsg {
	nx_uint8_t MsgType;		// Message type identifier
	nx_uint16_t ClientID;	// Client mote identifier
	nx_uint16_t ServerID;	// Server mote identifier
	nx_uint16_t Seq;		// Request sequence
	nx_uint16_t Value;		// Sensor data value
	nx_uint8_t Status;		// Return status
} returnMsg_t;


#endif /* SIMPLE_CS_H */
