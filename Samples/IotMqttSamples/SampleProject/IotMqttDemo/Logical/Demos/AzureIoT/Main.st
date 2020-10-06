
PROGRAM _CYCLIC

	CASE Step OF
		0:  //Generate connection parameters the first time and again after the password is about to expire	
			IF NOT IotMqttClient_0.Connected THEN
				Parameters;
				TON_0.IN := TRUE;
				TON_0.PT := UDINT_TO_TIME((TimeToLiveHours*3600*1000/100)*80); //At 80% of TimeToLive, the password will be renewed
				Step := 1;
			END_IF;
		1:  //Connect
			IotMqttClient_0.Enable			:= TRUE;
			IotMqttClient_0.Connect 		:= TRUE;
			IotMqttClient_0.IotMqttLink 	:= ADR(IotMqttLink);
			IotMqttClient_0.Parameters		:= IotMqttParameters;
			Step := 2;
		2:  //Wait until password is about to expire
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				IotMqttClient_0.Connect := FALSE;	//disconnect temporary the device to renew the password
				IF NOT IotMqttClient_0.Connected THEN
                    Step := 0;
                END_IF;
            END_IF;
	END_CASE;
		
    IotMqttClient_0();
	TON_0();	
	Subscribe;
	Publish;
END_PROGRAM

PROGRAM _EXIT
    
	IotMqttClient_0(Enable	:= FALSE);
	IotMqttPublish_0(Enable	:= FALSE);	
	IotMqttSubscribe_0(Enable := FALSE);
 
END_PROGRAM

