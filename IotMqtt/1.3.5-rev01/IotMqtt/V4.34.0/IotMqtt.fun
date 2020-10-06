
{REDUND_ERROR} FUNCTION IotMqttConfig : INT (*Allows to configure library parameters. It only takes effect the first time it's called*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		ConfigParameters : REFERENCE TO IotMqttConfigParametersType;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK IotMqttClient
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : BOOL; (*Enables FUB*)
		Connect : BOOL; (*If the FUB is enabled, attemps to connect with the remote MQTT broker*)
		ErrorReset : BOOL; (*Clears the current error*)
		Parameters : {REDUND_UNREPLICABLE} IotMqttClientParType; (*Contains the client parameters*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*FUB is enabled and running*)
		Error : BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : DINT; (*Gives information about the error*)
		Info : IotMqttClientInfoType; (*Contains client information regarding the actual session*)
		Connected : BOOL; (*TRUE if MQTT client is connected with the remote broker*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK IotMqttPublish
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : BOOL; (*Enables FUB*)
		Send : BOOL; (*Edge sensitive. Will send a new message each time is set high*)
		Topic : UDINT; (*Pointer to STRING with the Topic Name*)
		QoS : IotMqttQosEnum; (*The quality of service (QoS) assigned to the message.*)
		Buffer : UDINT; (*Pointer to data buffer*)
		BufferLength : UDINT; (*Buffer length*)
		Retained : BOOL; (*Is message of type retain?*)
	END_VAR
	VAR_OUTPUT
		Busy : BOOL; (*Publishing*)
		Active : BOOL; (*FUB is enabled and client running*)
		Done : BOOL; (*Publish done*)
		Error : BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : DINT; (*Gives information about the error*)
		Info : IotMqttPublishInfoType; (*Contains information about the FUB instance*)
	END_VAR
	VAR
		_Send : BOOL;
		_Active : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK IotMqttSubscribe
	VAR_INPUT
		IotMqttLink : REFERENCE TO IoTMqttComIdentType; (*Connection to TP Configuration*)
		Enable : BOOL; (*Enables FUB. Subscription will take place at enable of the FUB, if the associated IotMqttClient FUB is enabled and connected.*)
		Read : BOOL; (*Edge sensitive. When activaded it will deliver one message from the internal FIFO*)
		Topic : UDINT; (*Pointer to STRING with the Topic Name*)
		SubscriptionQoS : IotMqttQosEnum; (*QoS that will be used when subscribing*)
		RecievedTopic : UDINT; (*Pointer to STRING with the Topic Name that triggered the subscribtion. This is usefull when using Wildcards*)
		RecievedTopicSize : UDINT; (*Size of the received topic buffer*)
		QueueSize : USINT; (*Length of the receive queue. When the FIFO queue is full, old frames are overwritten and output parameter NumberOfLostFrames starts counting.*)
		Buffer : UDINT; (*Pointer to memory area where the content of the read messages will be stored*)
		BufferSize : UDINT; (*Size of the memory area where the content of the read messages will be stored*)
	END_VAR
	VAR_OUTPUT
		Retained : BOOL; (*The read message from the FIFO has the "Retain" flag*)
		ReceivedQoS : IotMqttQosEnum; (*The read message from the FIFO has this QoS*)
		Active : BOOL; (*FUB is enabled and client running*)
		Subscribed : BOOL; (*Subscription completed succesfully*)
		MessageRetrieved : BOOL; (*Read operation completed succesfully*)
		Error : BOOL; (*There is an error, Check StatusID for more information*)
		StatusID : DINT; (*Gives information about the error*)
		Busy : BOOL; (*FUB is working*)
		NewDataValid : BOOL; (*Is TRUE if new data was received with the last FB call*)
		DataSize : UDINT; (*Length of the Buffer array used in bytes*)
		Info : IotMqttSubscribeInfoType; (*Contains information about the FUB instance*)
	END_VAR
	VAR
		_Enable : BOOL;
		_Active : BOOL;
		_Internal : UDINT;
		_FifoHandle : UDINT;
		_Read : BOOL;
		_Subscribing : BOOL;
		_FifoLock : UDINT;
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
