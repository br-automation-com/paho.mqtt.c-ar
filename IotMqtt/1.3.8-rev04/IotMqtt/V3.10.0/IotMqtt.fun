
{REDUND_ERROR} FUNCTION IotMqttConfig : INT (*Allows to configure library parameters. It only takes effect the first time it's called*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		ConfigParameters : REFERENCE TO IotMqttConfigParametersType;
	END_VAR
END_FUNCTION

{REDUND_UNREPLICABLE} FUNCTION_BLOCK IotMqttClient
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables FUB*)
		Connect : {REDUND_UNREPLICABLE} BOOL; (*If the FUB is enabled, attemps to connect with the remote MQTT broker*)
		ErrorReset : {REDUND_UNREPLICABLE} BOOL; (*Clears the current error*)
		Parameters : {REDUND_UNREPLICABLE} IotMqttClientParType; (*Contains the client parameters*)
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL; (*FUB is enabled and running*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Gives information about the error*)
		Info : {REDUND_UNREPLICABLE} IotMqttClientInfoType; (*Contains client information regarding the actual session*)
		Connected : {REDUND_UNREPLICABLE} BOOL; (*TRUE if MQTT client is connected with the remote broker*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK IotMqttPublish
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables FUB*)
		ErrorReset : {REDUND_UNREPLICABLE} BOOL; (*Reset errors on positive edge*)
		Send : {REDUND_UNREPLICABLE} BOOL; (*Edge sensitive. Will send a new message each time is set high*)
		SendTimeout : {REDUND_UNREPLICABLE} TIME; (*If message is not delivered after this time, an error will be set in the FB (if SendTimeout > 0)*)
		Topic : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the Topic Name*)
		QoS : {REDUND_UNREPLICABLE} IotMqttQosEnum; (*The quality of service (QoS) assigned to the message.*)
		Buffer : {REDUND_UNREPLICABLE} UDINT; (*Pointer to data buffer*)
		BufferLength : {REDUND_UNREPLICABLE} UDINT; (*Buffer length*)
		Retained : {REDUND_UNREPLICABLE} BOOL; (*Is message of type retain?*)
	END_VAR
	VAR_OUTPUT
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Publishing*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*FUB is enabled and client running*)
		Done : {REDUND_UNREPLICABLE} BOOL; (*Publish done*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Gives information about the error*)
		Info : {REDUND_UNREPLICABLE} IotMqttPublishInfoType; (*Contains information about the FUB instance*)
	END_VAR
	VAR
		_Send : {REDUND_UNREPLICABLE} BOOL;
		_Active : {REDUND_UNREPLICABLE} BOOL;
		_ErrorReset : {REDUND_UNREPLICABLE} BOOL;
		_t0 : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK IotMqttRegParPublish
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables FUB*)
		ErrorReset : {REDUND_UNREPLICABLE} BOOL; (*Reset errors on positive edge*)
		Update : {REDUND_UNREPLICABLE} BOOL; (*Edfe sensitive. Will update the internal values for PvName, Mode, PublishMode and SamplingTime*)
		Topic : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the Topic Name*)
		QoS : {REDUND_UNREPLICABLE} IotMqttQosEnum; (*The quality of service (QoS) assigned to the message.*)
		Retained : {REDUND_UNREPLICABLE} BOOL; (*Is message of type retain?*)
		SendTimeout : {REDUND_UNREPLICABLE} TIME; (*If message is not delivered after this time, an error will be set in the FB (if SendTimeout > 0)*)
		PvName : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the PV*)
		DataFormat : {REDUND_UNREPLICABLE} IotMqttDataFormatEnum; (*Allows choosing if variable will be serialized to Json or sent in binary form*)
		PublishMode : {REDUND_UNREPLICABLE} IotMqttPublishModeEnum; (*Which event or events will send the PV data?*)
		SamplingTime : {REDUND_UNREPLICABLE} TIME; (*Sampling rate used for saving new values (used for time-based send mode). On a change, the new value is only applied on a rising edge of Update*)
		Trigger : {REDUND_UNREPLICABLE} BOOL; (*Trigger (used for the recording mode that works with a trigger).*)
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL; (*FUB is enabled and client running*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*Working in serialization + sending*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Gives information about the error*)
		Info : {REDUND_UNREPLICABLE} IotMqttPublishInfoType; (*Contains information about the FUB instance*)
	END_VAR
	VAR
		_Publish : {REDUND_UNREPLICABLE} IotMqttPublish;
		_Serializer : {REDUND_UNREPLICABLE} UDINT;
		_Processing : {REDUND_UNREPLICABLE} BOOL;
		_prevPV : {REDUND_UNREPLICABLE} UDINT;
		_trig : {REDUND_UNREPLICABLE} BOOL;
		_addr : {REDUND_UNREPLICABLE} UDINT;
		_datalen : {REDUND_UNREPLICABLE} UDINT;
		_enable : {REDUND_UNREPLICABLE} BOOL;
		_pvname : {REDUND_UNREPLICABLE} UDINT;
		_publishmode : {REDUND_UNREPLICABLE} IotMqttPublishModeEnum;
		_mode : {REDUND_UNREPLICABLE} IotMqttDataFormatEnum;
		_update : {REDUND_UNREPLICABLE} BOOL;
		_samplingtime : {REDUND_UNREPLICABLE} TIME;
		_t0 : {REDUND_UNREPLICABLE} TIME;
		_pubCmd : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK IotMqttSubscribe
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables FUB. Subscription will take place at enable of the FUB, if the associated IotMqttClient FUB is enabled and connected.*)
		Read : {REDUND_UNREPLICABLE} BOOL; (*Edge sensitive. When activaded it will deliver one message from the internal FIFO*)
		Topic : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the Topic Name*)
		SubscriptionQoS : {REDUND_UNREPLICABLE} IotMqttQosEnum; (*QoS that will be used when subscribing*)
		RecievedTopic : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the Topic Name that triggered the subscribtion. This is usefull when using Wildcards*)
		RecievedTopicSize : {REDUND_UNREPLICABLE} UDINT; (*Size of the received topic buffer*)
		QueueSize : {REDUND_UNREPLICABLE} USINT; (*Length of the receive queue. When the FIFO queue is full, old frames are overwritten and output parameter NumberOfLostFrames starts counting.*)
		Buffer : {REDUND_UNREPLICABLE} UDINT; (*Pointer to memory area where the content of the read messages will be stored*)
		BufferSize : {REDUND_UNREPLICABLE} UDINT; (*Size of the memory area where the content of the read messages will be stored*)
	END_VAR
	VAR_OUTPUT
		Retained : {REDUND_UNREPLICABLE} BOOL; (*The read message from the FIFO has the "Retain" flag*)
		ReceivedQoS : {REDUND_UNREPLICABLE} IotMqttQosEnum; (*The read message from the FIFO has this QoS*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*FUB is enabled and client running*)
		Subscribed : {REDUND_UNREPLICABLE} BOOL; (*Subscription completed succesfully*)
		MessageRetrieved : {REDUND_UNREPLICABLE} BOOL; (*Read operation completed succesfully*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Gives information about the error*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*FUB is working*)
		NewDataValid : {REDUND_UNREPLICABLE} BOOL; (*Is TRUE if new data was received with the last FB call*)
		DataSize : {REDUND_UNREPLICABLE} UDINT; (*Length of the Buffer array used in bytes*)
		Info : {REDUND_UNREPLICABLE} IotMqttSubscribeInfoType; (*Contains information about the FUB instance*)
	END_VAR
	VAR
		_Enable : {REDUND_UNREPLICABLE} BOOL;
		_Active : {REDUND_UNREPLICABLE} BOOL;
		_Internal : {REDUND_UNREPLICABLE} UDINT;
		_FifoHandle : {REDUND_UNREPLICABLE} UDINT;
		_Read : {REDUND_UNREPLICABLE} BOOL;
		_Subscribing : {REDUND_UNREPLICABLE} BOOL;
		_FifoLock : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK IotMqttRegParSubscribe
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : {REDUND_UNREPLICABLE} BOOL; (*Enables FUB*)
		PvName : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the PV*)
		DataFormat : {REDUND_UNREPLICABLE} IotMqttDataFormatEnum; (*Allows choosing if variable will be serialized to Json or sent in binary form*)
		Topic : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the Topic Name*)
		QoS : {REDUND_UNREPLICABLE} IotMqttQosEnum; (*QoS that will be used when subscribing*)
		RecievedTopic : {REDUND_UNREPLICABLE} UDINT; (*Pointer to STRING with the Topic Name that triggered the subscribtion. This is usefull when using Wildcards*)
		QueueSize : {REDUND_UNREPLICABLE} UDINT; (*Length of the receive queue. When the FIFO queue is full, old frames are overwritten and output parameter NumberOfLostFrames starts counting.*)
		ReceiveBufferSize : {REDUND_UNREPLICABLE} UDINT; (*This is the maximum size of the buffer used to store each received message. It must be large enough to contain the largest message what the FUB will receive.*)
	END_VAR
	VAR_OUTPUT
		Retained : {REDUND_UNREPLICABLE} BOOL; (*The received message has the "Retain" flag*)
		Active : {REDUND_UNREPLICABLE} BOOL; (*FUB is enabled and client running*)
		Busy : {REDUND_UNREPLICABLE} BOOL; (*FUB is working*)
		Error : {REDUND_UNREPLICABLE} BOOL; (*There is an error, Check StatusID for more information*)
		UpdateNotification : {REDUND_UNREPLICABLE} BOOL; (*registered PV contains new values. This is automatically reset after one cycle.*)
		StatusID : {REDUND_UNREPLICABLE} DINT; (*Gives information about the error*)
		Info : {REDUND_UNREPLICABLE} IotMqttSubscribeInfoType; (*Contains information about the FUB instance*)
	END_VAR
	VAR
		_Receive : {REDUND_UNREPLICABLE} IotMqttSubscribe;
		_Parser : {REDUND_UNREPLICABLE} UDINT;
		_RecvBuffer : {REDUND_UNREPLICABLE} UDINT;
		_ReceiveBufferSize : {REDUND_UNREPLICABLE} UDINT; (*This is the maximum size of the buffer used to store each received message. It must be large enough to contain the largest message what the FUB will receive.*)
		_Step : {REDUND_UNREPLICABLE} USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION AzureGenerateDeviceCredentials : INT (*Given an AzureIoT Hub device connection string, and the "TimeToLive" parameter, will populate the needed parameters for connecting it*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		pConnectionString : UDINT; (*Pointer to string with the connection string*)
		TimeToLive : USINT; (*Time in hours that the password will be valid*)
		pParameters : UDINT; (*Pointer to the client parameters structure. Some of them will be automatically filled by the function*)
		PublishTelemetryTopic : UDINT; (*Pointer to string to store the publish topic*)
		SizeofPublishTelemetryTopic : UDINT; (*Size of PublishTelemetryTopic variable*)
		SubscribeTelemetryTopic : UDINT; (*Pointer to string to store the subscribe topic*)
		SizeofSubscribeTelemetryTopic : UDINT; (*Size of SubscribeTelemetryTopic variable*)
	END_VAR
END_FUNCTION

{REDUND_UNREPLICABLE} FUNCTION_BLOCK GoogleIotCredentials (*Get JWT token for MQTT connection*)
	VAR_INPUT
		Execute : {REDUND_UNREPLICABLE} BOOL;
		pIotMqttGoogleIotParameters : REFERENCE TO IotMqttGoogleIotParametersType;
		pJWT : {REDUND_UNREPLICABLE} UDINT; (*Pointer to string. It will be filled with JWT*)
		SizeOfJWT : {REDUND_UNREPLICABLE} UDINT; (*Size of destination JWT string*)
		pIotMqttClientParameters : REFERENCE TO IotMqttClientParType; (*Pointer to the client parameters structure. Some of them will be automatically filled by the function*)
	END_VAR
	VAR_OUTPUT
		Error : {REDUND_UNREPLICABLE} BOOL;
		Done : {REDUND_UNREPLICABLE} BOOL;
		Busy : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		_Execute : {REDUND_UNREPLICABLE} BOOL;
		_hTask : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
END_FUNCTION_BLOCK
