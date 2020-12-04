
ACTION Subscribe: 
	(* Commands *)
	brsmemset(ADR(TopicCommands),0,SIZEOF(TopicCommands));
	TopicCommands := '/devices/';
	brsstrcat(ADR(TopicCommands),ADR(GoogleIotParameters.DeviceID));
	brsstrcat(ADR(TopicCommands),ADR('/commands/#'));
	
	IotMqttSubscribe_Commands.Enable 			:= TRUE;
	IotMqttSubscribe_Commands.IotMqttLink		:= IotMqttClient_0.IotMqttLink; 
	IotMqttSubscribe_Commands.Topic				:= ADR(TopicCommands);
	IotMqttSubscribe_Commands.SubscriptionQoS	:= IotMqtt_QoS1;
	IotMqttSubscribe_Commands.RecievedTopic		:= ADR(ReceivedCommandsTopic); 
	IotMqttSubscribe_Commands.RecievedTopicSize	:= SIZEOF(ReceivedCommandsTopic);
	IotMqttSubscribe_Commands.QueueSize 		:= 50;
	IotMqttSubscribe_Commands.Buffer			:= ADR(ReceivedCommand); 
	IotMqttSubscribe_Commands.BufferSize	 	:= SIZEOF(ReceivedCommand);
	IotMqttSubscribe_Commands();

	(* Config *)
	TopicConfig := '/devices/';
	brsstrcat(ADR(TopicConfig),ADR(GoogleIotParameters.DeviceID));
	brsstrcat(ADR(TopicConfig),ADR('/config'));
	
	IotMqttSubscribe_Config.Enable 				:= TRUE;
	IotMqttSubscribe_Config.IotMqttLink			:= IotMqttClient_0.IotMqttLink; 
	IotMqttSubscribe_Config.Topic				:= ADR(TopicConfig);
	IotMqttSubscribe_Config.SubscriptionQoS		:= IotMqtt_QoS1;
	IotMqttSubscribe_Config.RecievedTopic		:= ADR(ReceivedConfigTopic); 
	IotMqttSubscribe_Config.RecievedTopicSize	:= SIZEOF(ReceivedConfigTopic);
	IotMqttSubscribe_Config.QueueSize 			:= 50;
	IotMqttSubscribe_Config.Buffer				:= ADR(ReceivedConfig); 
	IotMqttSubscribe_Config.BufferSize	 		:= SIZEOF(ReceivedConfig);
	IotMqttSubscribe_Config();
	
	
END_ACTION

