
ACTION Subscribe: 
	
	IotMqttSubscribe_0.Enable := TRUE;
	IotMqttSubscribe_0.IotMqttLink			:= IotMqttClient_0.IotMqttLink; 
	IotMqttSubscribe_0.Topic				:= ADR(PublishTopic);
	IotMqttSubscribe_0.SubscriptionQoS		:= IotMqtt_QoS0;
	IotMqttSubscribe_0.RecievedTopic		:= ADR(ReceivedTopic); 
	IotMqttSubscribe_0.RecievedTopicSize	:= SIZEOF(ReceivedTopic);
	IotMqttSubscribe_0.QueueSize 			:= 50;
	IotMqttSubscribe_0.Buffer				:= ADR(ReceiveBuffer); 
	IotMqttSubscribe_0.BufferSize	 		:= SIZEOF(ReceiveBuffer);
	IotMqttSubscribe_0();
		
	IF CmdAutoRead THEN
		IF IotMqttSubscribe_0.MessageRetrieved OR IotMqttSubscribe_0.StatusID <> 0 THEN
			IotMqttSubscribe_0.Read := FALSE;
		ELSIF IotMqttSubscribe_0.NewDataValid THEN
			IotMqttSubscribe_0.Read := TRUE;
		END_IF;	
	END_IF;
END_ACTION
