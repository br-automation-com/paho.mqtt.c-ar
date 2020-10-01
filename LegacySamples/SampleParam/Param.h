#ifndef _PARAM_H_
#define _PARAM_H_

#include <bur/plctypes.h>
#include "MQTTClient.h"

typedef struct
{
	BOOL restart;
	BOOL ssl;
	BOOL clean;
	BOOL login;
	BOOL certs;
	BOOL certs_onlyroot;
	BOOL reliable;
	STRING user[20];
	STRING password[20];
	UINT port;
	UDINT sleep;
	UDINT timeout;
	STRING ip[30];
	STRING url[50];
	UDINT cycles;
	STRING clientname[80];
	STRING topic[80];
	STRING message[256];
	MQTTClient_SSLOptions ssl_opts;
	MQTTClient_connectOptions conn_opts;

} param_typ;

void param_init(param_typ* param);

#define PARAM_INIT_200ms { 0, 0, 1, 0, 0, 0, 1, "", "", 0, 200, 0,"", "", 0, "MyClient", "World Topic", "Hello World plain!"} //mosquitto -p 1883 -v
#define PARAM_INIT_SSL_Login { 0, 1, 1, 1, 0, 0, 1, "user", "user", 0, 200, 0,"", "", 0, "MyClient", "World SSL Topic", "Hello World JUST Login!"} //default
#define PARAM_INIT_SSL_Certs { 0, 1, 1, 1, 1, 0, 1, "user", "", 0, 200, 0,"", "", 0, "MyClient", "World SSL Topic", "Hello World with all CERTS!"} //default
#define PARAM_INIT_SSL_CertsRoot { 0, 1, 1, 1, 1, 1, 1, "user", "", 0, 200, 0,"", "", 0, "MyClient", "World SSL Topic", "Hello World with ROOT CA!"} //default

#endif