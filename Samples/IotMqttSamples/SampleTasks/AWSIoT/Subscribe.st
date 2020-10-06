
ACTION Subscribe: 
	
	IotMqttSubscribe_0.Enable := TRUE;
	IotMqttSubscribe_0.IotMqttLink			:= IotMqttClient_0.IotMqttLink; 
	IotMqttSubscribe_0.Topic				:= ADR(SubscribeTopic);
	IotMqttSubscribe_0.SubscriptionQoS		:= IotMqtt_QoS1;
	IotMqttSubscribe_0.RecievedTopic		:= ADR(ReceivedTopic); 
	IotMqttSubscribe_0.RecievedTopicSize	:= SIZEOF(ReceivedTopic);
	IotMqttSubscribe_0.QueueSize 			:= 50;
	IotMqttSubscribe_0.Buffer				:= ADR(ReceiveBuffer); 
	IotMqttSubscribe_0.BufferSize	 		:= SIZEOF(ReceiveBuffer);
	IotMqttSubscribe_0();
	
END_ACTION
