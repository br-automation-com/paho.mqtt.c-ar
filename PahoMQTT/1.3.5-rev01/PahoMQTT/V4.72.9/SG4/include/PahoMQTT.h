/* Automation Studio generated header file */
/* Do not edit ! */
/* PahoMQTT 3.10.0 */

#ifndef _PAHOMQTT_
#define _PAHOMQTT_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef enum PAHO_LOG_LEVEL
{	PAHO_LOG_LEVEL_ERROR = 0,
	PAHO_LOG_LEVEL_WARNING = 1,
	PAHO_LOG_LEVEL_INFO = 2,
	PAHO_LOG_LEVEL_DEBUG = 3
} PAHO_LOG_LEVEL;

typedef struct PahoMQTT_Init
{
	/* VAR_INPUT (analog) */
	unsigned long MainThread;
	unsigned long ThreadParam;
	/* VAR_OUTPUT (analog) */
	plcstring ErrorInfo[81];
	unsigned short Status;
	/* VAR_INPUT (digital) */
	plcbit EnableLogger;
	plcbit SuspendThread;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} PahoMQTT_Init_typ;

typedef struct PahoMQTT_Cyclic
{
	/* VAR_INPUT (analog) */
	unsigned char LoggerLevel;
	/* VAR_OUTPUT (analog) */
	unsigned short Status;
	plcstring ErrorInfo[81];
	/* VAR (analog) */
	unsigned char _LoggerLevel;
	unsigned long _inst;
	/* VAR_INPUT (digital) */
	plcbit Resume;
	plcbit Suspend;
	plcbit Reset;
	/* VAR_OUTPUT (digital) */
	plcbit Alive;
	plcbit Running;
	/* VAR (digital) */
	plcbit _Resume;
	plcbit _Suspend;
	plcbit _Reset;
} PahoMQTT_Cyclic_typ;


/* Prototyping of functions and function blocks */
void PahoMQTT_Init(struct PahoMQTT_Init* inst);
void PahoMQTT_Cyclic(struct PahoMQTT_Cyclic* inst);
unsigned long PahoMQTT_IMQ_Create(unsigned long DataSize, unsigned long Messages);
plcbit PahoMQTT_IMQ_Push(unsigned long Queue, unsigned long Data, unsigned long TimeoutMs);
plcbit PahoMQTT_IMQ_Pop(unsigned long Queue, unsigned long Data, unsigned long TimeoutMs);
plcbit PahoMQTT_IMQ_Delete(unsigned long Queue);
plcbit PahoMQTT_Exit(void);
plcbit PahoMQTT_Sleep(unsigned long Milliseconds);
plcbit PahoMQTT_IsReset(void);
plcbit PahoMQTT_IsAlive(void);


#ifdef __cplusplus
};
#endif
#endif /* _PAHOMQTT_ */

