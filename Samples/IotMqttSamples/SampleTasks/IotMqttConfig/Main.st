
PROGRAM _INIT
    IotMqttConfigParams.UseFile               := TRUE;
    IotMqttConfigParams.LogFileDevice	      := 'USER';
    IotMqttConfigParams.LogFileName		      := 'IotMqttLog';
    IotMqttConfigParams.AppendTimestamp	      := FALSE;
    IotMqttConfigParams.OverwritteLogs	      := TRUE;
    IotMqttConfigParams.LogLevel		      := IOTMQTT_LOG_LEVEL_ERROR;
    IotMqttConfig(ADR(IotMqttConfigParams));
END_PROGRAM
