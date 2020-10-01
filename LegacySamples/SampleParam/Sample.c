#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

#include <stdlib.h>
#include <string.h>
#include <PahoMQTT.h>
#include "MQTTClient.h"
#include "Param.h"

#define ADDRESS     param->url
#define CLIENTID    param->clientname
#define TOPIC       param->topic
#define PAYLOAD     param->message
#define QOS         1
#define TIMEOUT     param->timeout

void sample(unsigned long param_adr)
{
	param_typ *param = (param_typ *)param_adr;
	
	do
	{
		param->restart = 0;
		param->cycles = 0;
		param_init(param);
		
		MQTTClient client;
		MQTTClient_message pubmsg = MQTTClient_message_initializer;
		MQTTClient_deliveryToken token;
		
		int rc;
		MQTTClient_create(&client, ADDRESS, CLIENTID, MQTTCLIENT_PERSISTENCE_NONE, NULL);
		   
		while(PahoMQTT_IsAlive())
		{
		   
			if ((rc = MQTTClient_connect(client, &param->conn_opts)) != MQTTCLIENT_SUCCESS)
			{
				PahoMQTT_Sleep(TIMEOUT);
			}
			else
			{
                printf("client connected!\n");
                
				while(MQTTClient_isConnected(client) && PahoMQTT_IsAlive())
				{
					pubmsg.payload      = PAYLOAD;
					pubmsg.payloadlen   = strlen(PAYLOAD);
					pubmsg.qos          = QOS;
					pubmsg.retained     = 0;
					MQTTClient_publishMessage(client, TOPIC, &pubmsg, &token);
					rc = MQTTClient_waitForCompletion(client, token, TIMEOUT);
			
					param->cycles++;
					PahoMQTT_Sleep(param->sleep);
				}
			}
		}
		MQTTClient_disconnect(client, TIMEOUT);
		MQTTClient_destroy(&client);
	
	} while(PahoMQTT_IsReset());
}
