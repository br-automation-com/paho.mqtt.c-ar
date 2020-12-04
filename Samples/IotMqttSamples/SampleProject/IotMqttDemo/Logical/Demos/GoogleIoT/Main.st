
PROGRAM _INIT

	Step := 99;
END_PROGRAM

PROGRAM _CYCLIC

	CASE Step OF
		0:
			IF NOT IotMqttClient_0.Connected THEN
				Parameters;
				GoogleIotCredentials_0.Execute := TRUE;
				IF GoogleIotCredentials_0.Done THEN
					TON_0.IN := TRUE;
					TON_0.PT := REAL_TO_TIME(TIME_TO_REAL(GoogleIotParameters.ExpirationPeriod)*0.8);
					GoogleIotCredentials_0.Execute := FALSE;	
					Step := 1;
				END_IF;
			END_IF;
		1:
			IotMqttClient_0.Enable			:= TRUE;
			IotMqttClient_0.Connect 		:= TRUE;
			IotMqttClient_0.IotMqttLink 	:= ADR(IotMqttLink);
			IotMqttClient_0.Parameters		:= IotMqttParameters;
			Step := 2;
			
		2:
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				IotMqttClient_0.Connect := FALSE;	//disconnect temporary the device to renew the password
				Step := 0;
			END_IF;
	END_CASE;
			
	IotMqttClient_0();
	TON_0();	
	GoogleIotCredentials_0();
		
	Subscribe;
	Publish;
END_PROGRAM

PROGRAM _EXIT
	
	IotMqttPublish_Events(Enable := FALSE);	
	IotMqttPublish_State(Enable := FALSE);
	IotMqttSubscribe_Commands(Enable := FALSE);
	IotMqttSubscribe_Config(Enable := FALSE);
	IotMqttClient_0(Enable := FALSE);
	
END_PROGRAM

