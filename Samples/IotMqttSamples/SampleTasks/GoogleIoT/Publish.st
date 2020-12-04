
ACTION Publish: 
	
	(* Events *)
	TopicEvents := '/devices/';
	brsstrcat(ADR(TopicEvents),ADR(GoogleIotParameters.DeviceID));
	brsstrcat(ADR(TopicEvents),ADR('/events'));
	
	brsmemset(ADR(PublishMessage),0,SIZEOF(PublishMessage));
	brsmemset(ADR(AuxString),0,SIZEOF(AuxString));
	PublishMessage := 'Test message #';
	AuxString := UDINT_TO_STRING(IotMqttPublish_Events.Info.MessagesPublished);
	brsstrcat(ADR(PublishMessage),ADR(AuxString));
	
	IotMqttPublish_Events.Enable		:= TRUE;
	IotMqttPublish_Events.IotMqttLink	:= IotMqttClient_0.IotMqttLink;
	IotMqttPublish_Events.Topic			:= ADR(TopicEvents);
	IotMqttPublish_Events.QoS			:= IotMqtt_QoS1;
	IotMqttPublish_Events.Buffer		:= ADR(PublishMessage);
	IotMqttPublish_Events.BufferLength	:= brsstrlen(ADR(PublishMessage));
	IotMqttPublish_Events.Retained		:= FALSE;
	
	IotMqttPublish_Events();

	(* State *)
	TopicState := '/devices/';
	brsstrcat(ADR(TopicState),ADR(GoogleIotParameters.DeviceID));
	brsstrcat(ADR(TopicState),ADR('/state'));
	
	brsmemset(ADR(PublishMessage),0,SIZEOF(PublishMessage));
	PublishMessage := '{projectVersion: 1.00}';
	
	IotMqttPublish_State.Enable			:= TRUE;
	IotMqttPublish_State.IotMqttLink	:= IotMqttClient_0.IotMqttLink;
	IotMqttPublish_State.Topic			:= ADR(TopicState);
	IotMqttPublish_State.QoS			:= IotMqtt_QoS1;
	IotMqttPublish_State.Buffer			:= ADR(PublishMessage);
	IotMqttPublish_State.BufferLength	:= brsstrlen(ADR(PublishMessage));
	IotMqttPublish_State.Retained		:= FALSE;
	
	IotMqttPublish_State();
	
END_ACTION
