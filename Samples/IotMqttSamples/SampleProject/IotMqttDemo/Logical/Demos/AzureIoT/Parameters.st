
ACTION Parameters: 
	ConnectionString := 'This parameter must be filled with the Azure Iot hub device connection string';
    TimeToLiveHours := 1; // The generated token will be valid for one hour
    
    AzureGenerateDeviceCredentials(ADR(ConnectionString),TimeToLiveHours,ADR(IotMqttParameters),ADR(PublishTopic),SIZEOF(PublishTopic),ADR(SubscribeTopic),SIZEOF(SubscribeTopic));

    IotMqttParameters.ConnectionType			:= IotMqtt_TCP;
	IotMqttParameters.Port						:= 8883;
	IotMqttParameters.CleanSession				:= FALSE;
	IotMqttParameters.KeepAliveInterval			:= T#30s;
	IotMqttParameters.AutomaticReconnect		:= TRUE;

	IotMqttParameters.TLS.UseTLS				:= TRUE;
	IotMqttParameters.TLS.CA					:= ADR('//CS:EXT/AzureRootCA.crt.pem');
	IotMqttParameters.TLS.EnableServerCertAuth	:= TRUE;
	
END_ACTION
