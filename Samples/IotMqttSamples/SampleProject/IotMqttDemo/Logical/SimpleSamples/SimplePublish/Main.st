PROGRAM _CYCLIC
	IotMqttParameters.ServerUri				:= 'broker.hivemq.com';
	IotMqttParameters.Port					:= 1883;
	IotMqttParameters.ClientID				:= 'B&R_SimplePublishSample';
	 
	IotMqttClient_0.Enable					:= TRUE;
	IotMqttClient_0.Connect					:= TRUE;
	IotMqttClient_0.IotMqttLink 			:= ADR(IotMqttLink);
	IotMqttClient_0.Parameters				:= IotMqttParameters;
	IotMqttClient_0();
	
	PublishMessage 							:= 'This is a sample message being sent';
	IotMqttPublish_0.Enable					:= TRUE;
	IotMqttPublish_0.IotMqttLink			:= IotMqttClient_0.IotMqttLink;
	IotMqttPublish_0.Topic					:= ADR('B&R_TestTopic/SimplePublishSample');
	IotMqttPublish_0.Buffer					:= ADR(PublishMessage);
	IotMqttPublish_0.BufferLength			:= brsstrlen(ADR(PublishMessage));
	IotMqttPublish_0();
END_PROGRAM

PROGRAM _EXIT
	IotMqttClient_0(Enable := FALSE);
	IotMqttPublish_0(Enable := FALSE); 
END_PROGRAM

