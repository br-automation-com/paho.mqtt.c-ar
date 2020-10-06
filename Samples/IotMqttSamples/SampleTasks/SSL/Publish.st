
ACTION Publish: 

	IF CmdAutoPublish THEN
		IF (IotMqttPublish_0.Done OR IotMqttPublish_0.Error) AND IotMqttClient_0.Connected THEN
			IotMqttPublish_0.Send := FALSE;
		ELSIF IotMqttClient_0.Connected THEN
			IotMqttPublish_0.Send := TRUE;
		END_IF;
	END_IF
	
	brsmemset(ADR(PublishMessage),0,SIZEOF(PublishMessage));
	brsmemset(ADR(AuxString),0,SIZEOF(AuxString));
	PublishMessage := ClientID;
	brsstrcat(ADR(PublishMessage),ADR(' Test message #'));
	AuxString := UDINT_TO_STRING(IotMqttPublish_0.Info.MessagesPublished);
	brsstrcat(ADR(PublishMessage),ADR(AuxString));
	
	IotMqttPublish_0.Enable			:= TRUE;
	IotMqttPublish_0.IotMqttLink	:= IotMqttClient_0.IotMqttLink;
	IotMqttPublish_0.Topic			:= ADR(PublishTopic);
	IotMqttPublish_0.QoS			:= IotMqtt_QoS0;
	IotMqttPublish_0.Buffer			:= ADR(PublishMessage);
	IotMqttPublish_0.BufferLength	:= brsstrlen(ADR(PublishMessage));
	IotMqttPublish_0.Retained		:= FALSE;
	
	IotMqttPublish_0();

END_ACTION
