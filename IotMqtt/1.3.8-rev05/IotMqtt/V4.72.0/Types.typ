
TYPE
	IotMqttConnTypeEnum : 
		(
		IotMqtt_TCP, (*Use standard TCP connection*)
		IotMqtt_WS (*Use connection over websockets*)
		);
	IotMqttQosEnum : 
		( (*The quality of service (QoS) assigned to the message.
*)
		IotMqtt_QoS0 := 0, (*Fire and forget - the message may not be delivered*)
		IotMqtt_QoS1 := 1, (*At least once - the message will be delivered, but may be delivered more than once in some circumstances*)
		IotMqtt_QoS2 := 2 (*Once and one only - the message will be delivered exactly once.*)
		);
	IotMqttPublishModeEnum : 
		(
		IOTMQTT_PUB_MODE_TIME, (*New data is published on a time basis. *)
		IOTMQTT_PUB_MODE_TRIGGER, (*New data is published after a trigger. *)
		IOTMQTT_PUB_MODE_VALUE, (*New data from the PVs is published after the value of the PV is changed. *)
		IOTMQTT_PUB_MODE_TIME_TRIGGER, (*New data is published at a certain time or after a trigger. *)
		IOTMQTT_PUB_MODE_TIME_VALUE, (*New data is published at a certain time or after the value of the registered PV changes. *)
		IOTMQTT_PUB_MODE_TRIGGER_VALUE, (*New data is published after a trigger or the value of the registered PV changes. *)
		IOTMQTT_PUB_MODE_TIME_TRG_VALUE (*New data is published at a certain time, after the value of the registered PV changes or after a trigger. *)
		);
	IotMqttLogLevelEnum : 
		(
		IOTMQTT_LOG_LEVEL_ERROR, (*Just errors are written to the log file or logger*)
		IOTMQTT_LOG_LEVEL_PROTOCOL, (*MQTT protocol operations are written to the log file or logger*)
		IOTMQTT_LOG_LEVEL_MAXIMUM (*Diagnosis messages are written to the log file or logger*)
		);
	IotMqttDataFormatEnum : 
		(
		IOTMQTT_VAR_BINARY,
		IOTMQTT_VAR_JSON
		);
	IotMqttConnectionStateEnum : 
		(
		IOTMQTT_DISABLED, (*Client FUB is disabled*)
		IOTMQTT_DISCONNECTED, (*Client FUB is enabled and disconnected*)
		IOTMQTT_DISCONNECTING, (*Client FUB is enabled and disconnecting*)
		IOTMQTT_CONNECTED, (*Client FUB is enabled and connected*)
		IOTMQTT_CONNECTING, (*Client FUB is enabled and connecting*)
		IOTMQTT_CONNECTION_LOST, (*Client FUB is enabled and lost the connection*)
		IOTMQTT_CONNECTION_ERROR (*Client FUB is enabled and can't connect*)
		);
	IotMqttVersionEnum : 
		(
		IOTMQTT_MQTT_VERSION_DEFAULT, (*Default = MQTT v3.1*)
		IOTMQTT_MQTT_VERSION_5_0 (*Use this for LastWillDelay and SessionExpiryInterval *)
		);
	IotMqttPayloadType : 	STRUCT 
		pData : UDINT; (*Pointer to data buffer*)
		Len : UDINT; (*Length of data buffer*)
	END_STRUCT;
	IotMqttSubscribeInfoType : 	STRUCT 
		NumberOfLostMessages : UDINT; (*Number of discarded messages because fifo was full*)
		MessagesInQueue : UDINT; (*Number of waiting messages in the fifo*)
		AvailableMessageSlots : UDINT; (*Number of available message slots in the fifo*)
		TotalReceivedMessages : UDINT; (*Total number of received messages (including discarded messages)*)
	END_STRUCT;
	IotMqttPublishInfoType : 	STRUCT 
		MessagesPublished : UDINT; (*Number of sent messages*)
		DeliveriesCompleted : UDINT; (*Number of acknowledged messages (delivery confirmed). Only used when QoS > 0*)
		PublishErrorCounter : UDINT; (*Number of errors publishing*)
	END_STRUCT;
	IotMqttClientParType : 	STRUCT 
		ServerUri : STRING[255]; (*String containing broker's URI*)
		Port : UINT := 1883; (*TCP port number used to connect to MQTT broker*)
		ClientID : STRING[255]; (*String containing ClientID. Must be unique inside the broker*)
		UserName : STRING[255]; (*String. MQTT servers that support the MQTT v3.1 protocol provide authentication and authorisation by user name and password. This is the user name parameter*)
		Password : STRING[2550]; (*String. MQTT servers that support the MQTT v3.1 protocol provide authentication and authorisation by user name and password. This is the password parameter*)
		KeepAliveInterval : TIME := T#30s; (*The "keep alive" interval, defines the maximum time
that should pass without communication between the client and the server
The client will ensure that at least one message travels across the
network within each keep alive period.  In the absence of a data-related
message during the time period, the client sends a very small MQTT
"ping" message, which the server will acknowledge. The keep alive
interval enables the client to detect when the server is no longer
available without having to wait for the long TCP/IP timeout.
Set to 0 if you do not want any keep alive processing.*)
		LastWill : IotMqttClientParLastWillType; (*LastWill is enabled when the Topic Pointer is set*)
		ConnectTimeout : TIME; (*The time interval to allow a connect to complete*)
		MaxInFlight : UINT; (*This controls how many messages can be in-flight simultaneously.*)
		MinRetryInterval : TIME; (*Minimum retry interval .  Doubled on each failed retry*)
		MaxRetryInterval : TIME; (*Maximum retry interval .  The doubling stops here on failed retries.*)
		TLS : IotMqttClientParTLSType; (*TLS parameters*)
		PersistentData : BOOL; (*Enables persistentData on QOS > 0 items*)
		AutomaticReconnect : BOOL := TRUE; (*Reconnect automatically in the case of a connection being lost*)
		ConnectionType : IotMqttConnTypeEnum := IotMqtt_TCP; (*Determines if the connection will use standard TCP or WebSockets*)
		CleanSession : BOOL; (*When cleansession is true, the state information is discarded at connect and disconnect. Setting cleansession to false keeps the state information*)
		OfflinePublish : {REDUND_UNREPLICABLE} BOOL := FALSE; (*Whether to allow messages to be sent when the client is not connected.*)
		OfflinePublishBuffer : UINT := 100; (*The maximum number of messages allowed to be buffered while not connected.*)
		MqttVersion : IotMqttVersionEnum := IOTMQTT_MQTT_VERSION_DEFAULT;
		SessionExpiryInterval : TIME := T#0S; (*[s] MQTT v5.0: If it is set to 0, or is absent, the Session ends when the Network Connection is closed. If the Session Expiry Interval is 0xFFFFFFFF (UINT_MAX), the Session does not expire. Using LastWillDelayInterval, the value of SessionExpiryInterval should be >= LastWillDelayInterval*)
		CleanStart : BOOL := FALSE; (*MQTT v5.0: Setting of Clean Start to 1 and Session Expiry Interval to 0 is equivalent in MQTT v3.1.1 of setting Clean Session to 1.*)
		LastWillDelayInterval : TIME := T#0S; (*[s] MQTT v5.0: The Server delays publishing the Client’s Will Message until the Last Will Delay Interval has passed or the Session ends -> see Seesion Expiry Interval*)
	END_STRUCT;
	IotMqttClientParTLSType : 	STRUCT 
		UseTLS : BOOL; (*Set to TRUE if TLS encryption is needed*)
		CA : UDINT; (*Pointer to string. Name of the ca certificate stored in the CertificateStore*)
		Cert : UDINT; (*Pointer to string. Name of the client certificate file stored in the CertificateStore*)
		PrivateKey : UDINT; (*Pointer to string. Name of the private key file stored in the CertificateStore*)
		PrivateKeyPassword : UDINT; (*Pointer to string. The password to load the client's privateKey if encrypted*)
		EnabledCipherSuites : UDINT; (*Pointer to String.The list of cipher suites that the client will present to the server during the SSL handshake. For a
full explanation of the cipher list format, please see the OpenSSL on-line documentation:
http://www.openssl.org/docs/apps/ciphers.html#CIPHER_LIST_FORMAT
If this setting is ommitted, its default value will be "ALL", that is, all the cipher suites -excluding
those offering no encryption- will be considered.
This setting can be used to set an SSL anonymous connection ("aNULL" string value, for instance).*)
		EnableServerCertAuth : BOOL; (*True/False option to enable verification of the server certificate*)
	END_STRUCT;
	IotMqttClientParLastWillType : 	STRUCT 
		UseLastWill : BOOL; (*Makes use of last will and testament feature*)
		Topic : UDINT; (*Pointer to NULL terminated string containing topic of the message*)
		Buffer : UDINT; (*Pointer to NULL terminated string with the content of the message*)
		BufferLength : UDINT; (*Bufferlenght to send*)
		QoS : IotMqttQosEnum; (*QoS parameter (0 - 2)*)
		Retain : BOOL; (*Is the message of type retain?*)
		Payload : IotMqttPayloadType; (*Content payload, to be used (instead of Buffer) when sending binary data*)
	END_STRUCT;
	IotMqttClientInfoType : 	STRUCT 
		ConnectionState : IotMqttConnectionStateEnum; (*Unable to find host , Connecting , Connected , Connection Lost , Retrying *)
		NumberActivePublishersFubs : UDINT; (*Number of active Publishers FUBs attached to this client*)
		NumberActiveSubscribersFubs : UDINT; (*Number of active Subscribers FUBs attached to this client*)
		PublishMessageCount : UDINT; (*Total number of messages published by this client since enabled*)
		SubscribeMessageCount : UDINT; (*Total number of messages received by this client since enabled*)
		PendingMessagesCount : UDINT; (*Total number of messages pendinf of delivery*)
	END_STRUCT;
	IotMqttReceivedMessageType : 	STRUCT 
		Topic : UDINT; (*Pointer to the topic of the message*)
		TopicLen : UINT; (*Length of the topic*)
		Buffer : UDINT; (*Pointer to the buffer with the content of the message*)
		BufferLen : UDINT; (*Length of the message buffer*)
		QoS : USINT; (*QoS parameter (0 - 2)*)
		Retained : BOOL; (*Is the message of type retain?*)
	END_STRUCT;
	IoTMqttComIdentType : 	STRUCT 
		Internal : UDINT;
		pThreadHandle : UDINT;
		pThreadAttr : UDINT;
		inst : UDINT;
	END_STRUCT;
	IotMqttConfigParametersType : 	STRUCT 
		LogLevel : IotMqttLogLevelEnum := IOTMQTT_LOG_LEVEL_ERROR; (*Log level*)
		UseLogger : BOOL := 0; (*Use logger*)
		LoggerName : STRING[8] := 'IotMqtt'; (*String containing the logger name. Only used if UseLogger is set*)
		LoggerSize : UDINT := 2000000; (*Size of the logger in bytes*)
		UseFile : BOOL := 1; (*Use file to output the log results*)
		LogFileName : STRING[80] := 'IotMqttLog.txt'; (*String containing the file name. Only used if UseFile is set*)
		LogFileDevice : STRING[80] := ''; (*String containing the filedevice name. Only used if UseFile is set*)
		AppendTimestamp : BOOL := FALSE; (*A timestamp will be added to the filename so that it generates unique filenames. If disabled and the file already exists, it will be overwritten*)
		OverwritteLogs : BOOL := TRUE; (*If set, it will delete previous logs if the name matches and no timestamp is added*)
		PersistenceFileDevice : STRING[80] := 'IOTMQTT'; (*String containing the FileDevice for persistence files*)
	END_STRUCT;
	IotMqttGoogleIotJwtAlgorithmEnum : 
		(
		IotMqttGoogleIotAlgorithm_RS256,
		IotMqttGoogleIotAlgorithm_ES256
		);
	IotMqttGoogleIotParametersType : 	STRUCT 
		ProjectID : STRING[80];
		Region : STRING[80];
		RegistryID : STRING[80];
		DeviceID : STRING[80];
		ExpirationPeriod : TIME; (*Token expiration period*)
		Algorithm : IotMqttGoogleIotJwtAlgorithmEnum;
	END_STRUCT;
END_TYPE
