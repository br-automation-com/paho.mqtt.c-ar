
ACTION Parameters: 

	//Prepare Client ID. Add a timestamp to ensure any client will repeat it
	UtcDTGetTime_0(enable := TRUE);
	IF brsstrcmp(ADR(ClientID),ADR('')) = 0 THEN	
		ClientID := 'B&R_Demo_';
		ST_name(0,ADR(ThreadName),0);
		brsstrcat(ADR(ClientID),ADR(ThreadName));
		brsstrcat(ADR(ClientID),ADR("_"));
		brsmemset(ADR(AuxString),0,SIZEOF(AuxString));
		AuxString := UDINT_TO_STRING(DT_TO_UDINT(UtcDTGetTime_0.DT1));
		brsstrcat(ADR(ClientID),ADR(AuxString));	//Timestamp
	END_IF
	
	IotMqttParameters.ServerUri				:= 'test.mosquitto.org';
	IotMqttParameters.ConnectionType		:= IotMqtt_WS;	//Use standard websocket
	IotMqttParameters.Port					:= 8080;
	IotMqttParameters.TLS.UseTLS			:= FALSE;
	IotMqttParameters.ClientID				:= ClientID;
	IotMqttParameters.CleanSession			:= TRUE;
	IotMqttParameters.KeepAliveInterval		:= T#20s;
	IotMqttParameters.AutomaticReconnect	:= TRUE;

END_ACTION
