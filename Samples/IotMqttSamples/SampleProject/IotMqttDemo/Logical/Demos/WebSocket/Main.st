

PROGRAM _CYCLIC
	
	Parameters;
	
	IotMqttClient_0.Enable			:= TRUE;
	IotMqttClient_0.Connect			:= TRUE;
	IotMqttClient_0.IotMqttLink 	:= ADR(IotMqttLink);
	IotMqttClient_0.Parameters		:= IotMqttParameters;
	IotMqttClient_0();
		
	PublishTopic	:= 'B&R_DemoProject/WS';
	brsstrcat(ADR(PublishTopic),ADR(ClientID));
	
	Subscribe;
	Publish;
END_PROGRAM

PROGRAM _EXIT
	
    IotMqttClient_0(Enable	:= FALSE);
    IotMqttPublish_0(Enable	:= FALSE);	
    IotMqttSubscribe_0(Enable := FALSE);
    
END_PROGRAM

