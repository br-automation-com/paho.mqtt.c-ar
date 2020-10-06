/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASHW_
#define _ASHW_
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
 #define ASHW_BATTERY_OK 1U
 #define ASHW_BATTERY_LOW 0U
 #define ASHW_USER_LED_ON 1U
 #define ASHW_BATTERY_NOTEST 2U
 #define ASHW_BATTERY_MISSING 3U
 #define ERR_ASHW_INVALID_DEVICE 28850U
 #define ERR_ASHW_INVALID_ORDINAL 28851U
 #define ERR_ASHW_INVALID_BEEP_PARAMETER 28852U
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned char ASHW_BATTERY_OK;
 _GLOBAL_CONST unsigned char ASHW_BATTERY_LOW;
 _GLOBAL_CONST unsigned char ASHW_USER_LED_ON;
 _GLOBAL_CONST unsigned char ASHW_BATTERY_NOTEST;
 _GLOBAL_CONST unsigned char ASHW_BATTERY_MISSING;
 _GLOBAL_CONST unsigned short ERR_ASHW_INVALID_DEVICE;
 _GLOBAL_CONST unsigned short ERR_ASHW_INVALID_ORDINAL;
 _GLOBAL_CONST unsigned short ERR_ASHW_INVALID_BEEP_PARAMETER;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct HwGetBatteryInfo
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char ordinal;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned char state;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HwGetBatteryInfo_typ;

typedef struct HwGetTemperature
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char ordinal;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long temperature;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HwGetTemperature_typ;

typedef struct HwGetMode
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char ordinal;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned char mode;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HwGetMode_typ;

typedef struct HwGetNode
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char ordinal;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned char node;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_reserve;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HwGetNode_typ;

typedef struct HwSetUserLED
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char ordinal;
	unsigned char value;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HwSetUserLED_typ;

typedef struct HwGetCfSerialNumber
{
	/* VAR_INPUT (analog) */
	unsigned long pDevice;
	unsigned char ordinal;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	plcstring cfSerialNumber[32];
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
} HwGetCfSerialNumber_typ;

typedef struct HwGetCfPluggedInfo
{
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned short i_state;
	unsigned short i_result;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit isPlugged;
} HwGetCfPluggedInfo_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void HwGetBatteryInfo(struct HwGetBatteryInfo* inst);
_BUR_PUBLIC void HwGetTemperature(struct HwGetTemperature* inst);
_BUR_PUBLIC void HwGetMode(struct HwGetMode* inst);
_BUR_PUBLIC void HwGetNode(struct HwGetNode* inst);
_BUR_PUBLIC void HwSetUserLED(struct HwSetUserLED* inst);
_BUR_PUBLIC void HwGetCfSerialNumber(struct HwGetCfSerialNumber* inst);
_BUR_PUBLIC void HwGetCfPluggedInfo(struct HwGetCfPluggedInfo* inst);
_BUR_PUBLIC unsigned short HwSetBeep(unsigned long frequency, unsigned long beepTime);


#ifdef __cplusplus
};
#endif
#endif /* _ASHW_ */

