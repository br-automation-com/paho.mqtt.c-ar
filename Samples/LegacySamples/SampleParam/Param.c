#include "Param.h"

int snprintf(char * s, size_t n, const char * format, ... );

void param_init(param_typ* param)
{
	MQTTClient_SSLOptions ssl_opts = MQTTClient_SSLOptions_initializer;
	MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
	
	param->ssl_opts = ssl_opts;
	param->conn_opts = conn_opts;
	

	param->conn_opts.keepAliveInterval = 10;
	param->conn_opts.reliable = param->reliable;
    param->conn_opts.cleansession = param->clean;

	if(!param->ip[0]) snprintf(param->ip, sizeof(param->ip)-1, "mqtt.eclipse.org");
	
	if(param->ssl)
	{
		param->conn_opts.ssl = &param->ssl_opts;
		
		if(!param->port) param->port = 8883;
		snprintf(param->url,sizeof(param->url)-1,"ssl://%s:%d",param->ip,param->port);
		if(!param->message[0]) snprintf(param->message,sizeof(param->message)-1, "hello secure world!");
		
		param->ssl_opts.enableServerCertAuth = 0;
		param->ssl_opts.enabledCipherSuites = "ALL";
		
		if(param->login)
		{
		   	conn_opts.username = param->user;
		   	conn_opts.password = param->password;
		}
		else
		{
		//	param->ssl_opts.enabledCipherSuites = "aNULL";
		}
		
		if(param->certs)
		{
			
			param->ssl_opts.trustStore = "ca.crt";
			if(!param->certs_onlyroot)
			{
				param->ssl_opts.keyStore = "client.crt";
				param->ssl_opts.privateKey = "client.key";
				param->ssl_opts.privateKeyPassword = param->password;
			}
			
		}
		
	}
	else
	{
		if(!param->port) param->port = 1883;
		snprintf(param->url,sizeof(param->url)-1,"tcp://%s:%d",param->ip,param->port);
		if(!param->message[0]) snprintf(param->message,sizeof(param->message)-1, "hello world!");
		
		if(param->login)
		{
		   	conn_opts.username = param->user;
		   	conn_opts.password = param->password;
		}
	}	
	if(!param->timeout) param->timeout = 5000;
	if(!param->sleep) param->sleep = 2000;
}
