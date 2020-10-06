PROGRAM _CYCLIC
    IotMqttParameters.ServerUri				:= 'broker.hivemq.com';
    IotMqttParameters.Port					:= 1883;
    IotMqttParameters.ClientID				:= 'B&R_SimpleSubscribeSample';
	 
    IotMqttClient_0.Enable					:= TRUE;
    IotMqttClient_0.Connect					:= TRUE;
    IotMqttClient_0.IotMqttLink 			:= ADR(IotMqttLink);
    IotMqttClient_0.Parameters				:= IotMqttParameters;
    IotMqttClient_0();

    IotMqttSubscribe_0.Enable 				:= TRUE;
    IotMqttSubscribe_0.IotMqttLink			:= IotMqttClient_0.IotMqttLink; 
    IotMqttSubscribe_0.Topic				:= ADR('B&R_TestTopic/SimpleSubscribeSample');
    IotMqttSubscribe_0.RecievedTopic		:= ADR(ReceivedTopic); 
    IotMqttSubscribe_0.RecievedTopicSize	:= SIZEOF(ReceivedTopic);
    IotMqttSubscribe_0.QueueSize 			:= 50;
    IotMqttSubscribe_0.Buffer				:= ADR(ReceiveBuffer); 
    IotMqttSubscribe_0.BufferSize	 		:= SIZEOF(ReceiveBuffer);
    IotMqttSubscribe_0();
END_PROGRAM

PROGRAM _EXIT
	IotMqttClient_0(Enable := FALSE);
	IotMqttSubscribe_0(Enable := FALSE);
END_PROGRAM

