
PROGRAM _INIT
	pvname := 'RegParPub:testVar';
	testVar := 0;
	IotMqttRegParPublish_0.SamplingTime			:= T#10s;
END_PROGRAM	

PROGRAM _CYCLIC
	IotMqttParameters.ServerUri				:= 'test.mosquitto.org';
	IotMqttParameters.Port					:= 1883;
	IotMqttParameters.ClientID				:= 'B&R_SimplePublishSample58225';
	 
	IotMqttClient_0.Enable					:= TRUE;
	IotMqttClient_0.Connect					:= TRUE;
	IotMqttClient_0.IotMqttLink 			:= ADR(IotMqttLink);
	IotMqttClient_0.Parameters				:= IotMqttParameters;
	IotMqttClient_0();
	
	//IotMqttRegParPublish_0.Enable			:= TRUE;
	IotMqttRegParPublish_0.IotMqttLink		:= IotMqttClient_0.IotMqttLink;
	IotMqttRegParPublish_0.Topic			:= ADR('B&R_TestTopic/RegParPublishSample_');
	IotMqttRegParPublish_0.PvName			:= ADR(pvname);
	IotMqttRegParPublish_0.PublishMode		:= IOTMQTT_PUB_MODE_TRIGGER;
	IotMqttRegParPublish_0.DataFormat		:= IOTMQTT_VAR_JSON;
	IotMqttRegParPublish_0();
	
	IotMqttRegParSubscribe_0.IotMqttLink := IotMqttClient_0.IotMqttLink;
//	IotMqttRegParSubscribe_0.Enable := TRUE;
	IotMqttRegParSubscribe_0.PvName := ADR(pvname);
	IotMqttRegParSubscribe_0.DataFormat := IOTMQTT_VAR_JSON;
	IotMqttRegParSubscribe_0.Topic := ADR('B&R_TestTopic/RegParSubscribeSample_');
	IotMqttRegParSubscribe_0.QoS := 0;
	IotMqttRegParSubscribe_0.QueueSize := 50;
	IotMqttRegParSubscribe_0.ReceiveBufferSize := 50000;
	IotMqttRegParSubscribe_0();
END_PROGRAM

PROGRAM _EXIT
	IotMqttClient_0(Enable := FALSE);
	IotMqttRegParPublish_0(Enable := FALSE);
	IotMqttRegParSubscribe_0(Enable := FALSE);
END_PROGRAM

