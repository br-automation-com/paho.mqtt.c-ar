
ACTION Parameters: 

	IotMqttParameters.ConnectionType			:= IotMqtt_TCP;
	IotMqttParameters.ClientID					:= 'BR_CoffeeMachine';
	IotMqttParameters.ServerUri					:= 'Must be filled with your device endpoint, obtained at the AWS IoT portal';
	IotMqttParameters.Port						:= 8883;
	IotMqttParameters.CleanSession				:= FALSE;
	IotMqttParameters.KeepAliveInterval			:= T#30s;
	IotMqttParameters.AutomaticReconnect		:= TRUE;

	IotMqttParameters.TLS.UseTLS				:= TRUE;
	IotMqttParameters.TLS.CA					:= ADR('//CS:EXT/AmazonRootCA.pem');
	IotMqttParameters.TLS.Cert					:= ADR('//CS:OWN/BR_CoffeeMachine_certificate.pem.crt'); //Aws thing certificate, downloaded from Aws Iot portal
	IotMqttParameters.TLS.PrivateKey			:= ADR('//CS:KEY/BR_CoffeeMachine_private.pem.key');//Aws thing private key, downloaded from Aws Iot portal
	IotMqttParameters.TLS.EnableServerCertAuth	:= TRUE;
	
END_ACTION
