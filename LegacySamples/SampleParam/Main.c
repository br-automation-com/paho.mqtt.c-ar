
#include <bur/plctypes.h>
#include "Param.h"
#include "PahoMQTT.h"

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

void sample(unsigned long param_adr);

_LOCAL param_typ Param;
_LOCAL USINT loadTestCase;
_LOCAL PahoMQTT_Init_typ PahoMQTT_Init_0;
_LOCAL PahoMQTT_Cyclic_typ PahoMQTT_Cyclic_0;


void _INIT ProgramInit(void)
{	
	PahoMQTT_Cyclic_0.LoggerLevel = 4;

	PahoMQTT_Init_0.EnableLogger = 1;
	PahoMQTT_Init_0.MainThread = (UDINT)sample;
	PahoMQTT_Init_0.ThreadParam = (UDINT)&Param;
	PahoMQTT_Init_0.SuspendThread = 1;
	PahoMQTT_Init(&PahoMQTT_Init_0);
}


void _CYCLIC ProgramCyclic(void)
{
	PahoMQTT_Cyclic_0.Reset = Param.restart;
	PahoMQTT_Cyclic(&PahoMQTT_Cyclic_0);
	
	switch(loadTestCase)
	{
		case 1:
			{
				param_typ p = PARAM_INIT_200ms;
				ST_name(0,p.clientname,0);
				Param = p;
			}
			break;
		case 2:
			{
				param_typ p = PARAM_INIT_SSL_Login;
				ST_name(0,p.clientname,0);
				Param = p;
			}
			break;
		case 3:
			{
				param_typ p = PARAM_INIT_SSL_Certs;
				ST_name(0,p.clientname,0);
				Param = p;
			}
			break;
		case 4:
			{	
				param_typ p = PARAM_INIT_SSL_CertsRoot;
				ST_name(0,p.clientname,0);
				Param = p;
			}
			break;
	}
	loadTestCase = 0;
}

void _EXIT ProgramExit(void)
{
	PahoMQTT_Exit();
}
