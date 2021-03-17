
ACTION Parameters: 
	
	(****************************** user defined parameters*********************************)
	GoogleIotParameters.DeviceID 						:= 'BR_PLC';
	GoogleIotParameters.ProjectID						:= 'mytestiotproject';
	GoogleIotParameters.Region							:= 'europe-west1';
	GoogleIotParameters.RegistryID						:= 'iotcore-registry';
	GoogleIotParameters.ExpirationPeriod				:= T#1h;
	GoogleIotParameters.Algorithm						:= IotMqttGoogleIotAlgorithm_ES256;
	(***************************************************************************************)
	
	IotMqttParameters.ConnectionType					:= IotMqtt_TCP;	//Use standard tcp with TLS
	IotMqttParameters.CleanSession						:= TRUE;
	IotMqttParameters.KeepAliveInterval					:= T#60s;
	IotMqttParameters.AutomaticReconnect				:= TRUE;

	IotMqttParameters.TLS.UseTLS						:= TRUE;
	IotMqttParameters.TLS.EnableServerCertAuth			:= TRUE;
	IotMqttParameters.TLS.CA							:= ADR('//CS:EXT/GoogleIoT.pem');
	IotMqttParameters.TLS.PrivateKey					:= ADR('//CS:KEY/GoogleIoT_privKey.pem');
	
	
	GoogleIotCredentials_0.pIotMqttClientParameters		:= ADR(IotMqttParameters);
	GoogleIotCredentials_0.pIotMqttGoogleIotParameters	:= ADR(GoogleIotParameters);
	
END_ACTION
