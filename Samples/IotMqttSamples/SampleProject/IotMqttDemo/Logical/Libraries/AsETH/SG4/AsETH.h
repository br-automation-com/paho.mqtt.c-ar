/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASETH_
#define _ASETH_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define ethERR_SYSTEM 32899U
 #define ethERR_PARAMETER 32850U
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned short ethERR_SYSTEM;
 _GLOBAL_CONST unsigned short ethERR_PARAMETER;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct ethSTATISTICS_typ
{	unsigned long bytesrecv;
	unsigned long bytessend;
	unsigned long packetsrecv;
	unsigned long packetssend;
	unsigned long mcpacketsrecv;
	unsigned long mcpacketssend;
	unsigned long errorrecv;
	unsigned long errorsend;
	unsigned long errorframe;
	unsigned long errorcrc;
	unsigned long collisions;
	unsigned long latecollision;
	unsigned long drops;
	unsigned long lostcarrier;
	unsigned long underflow;
	unsigned long retry;
	unsigned long noproto;
	unsigned long intrecv;
	unsigned long intsend;
	unsigned long bufferrecv;
	unsigned long buffersend;
	unsigned long broadcasts;
	unsigned long broadcaststop;
	unsigned long reserve[10];
} ethSTATISTICS_typ;

typedef struct EthStat
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned long pStat;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	/* VAR_INPUT (digital) */
	plcbit enable;
} EthStat_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void EthStat(struct EthStat* inst);
_BUR_PUBLIC unsigned short ethInetAton(unsigned long pIpStr, unsigned long pIpAdr);
_BUR_PUBLIC unsigned short ethInetNtoa(unsigned long ipAdr, unsigned long pIpStr);


#ifdef __cplusplus
};
#endif
#endif /* _ASETH_ */

