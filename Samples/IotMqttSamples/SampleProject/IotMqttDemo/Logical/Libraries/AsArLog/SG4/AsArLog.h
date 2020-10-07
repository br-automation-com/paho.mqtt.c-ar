/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ASARLOG_
#define _ASARLOG_
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
 #define arlogERR_NO_MORE_ENTRY 31425U
 #define arlogERR_READ_ASCII_BUFFER 31424U
 #define arlogERR_READ_BINARY_BUFFER 31423U
 #define arlogERR_INVALID_ENTRY 31422U
 #define arlogERR_INVALID_INDEX 31421U
 #define arlogERR_READ_BUFFER 31420U
 #define arlogERR_READ 31419U
 #define arlogERR_WRITE_CALC_DATA 31418U
 #define arlogERR_WRITE 31417U
 #define arlogERR_NOTEXISTING 31416U
 #define arlogERR_NOMEMORY 31412U
 #define arlogERR_DELETE 31411U
 #define arlogERR_INVALID_IDENT 31410U
 #define arlogERR_IN_ACCESS 31409U
 #define arlogERR_ACCESS_DENIED 31408U
 #define arlogERR_INSTALL 31407U
 #define arlogERR_CREATE 31406U
 #define arlogERR_EXISTING 31405U
 #define arlogERR_ILL_LEN 31404U
 #define arlogERR_ILL_PARAM 31403U
 #define arlogERR_ILL_LOGLEVEL 31402U
 #define arlogERR_ILL_MEMTYPE 31401U
 #define arlogERR_ILL_NAME 31400U
 #define arlogBASE_REDUND_LOG_IDENT 4U
 #define arlogBASE_SAFETY_LOG_IDENT 3U
 #define arlogBASE_FIELDBUS_LOG_IDENT 2U
 #define arlogBASE_USER_LOG_IDENT 1U
 #define arlogBASE_SYSTEM_LOG_IDENT 0U
 #define arlogMIN_LOGDATA_SIZE 4096U
 #define arlogLEVEL_FATAL 3U
 #define arlogLEVEL_WARNING 2U
 #define arlogLEVEL_INFO 1U
 #define arlogUSRROM 2U
 #define arlogUSRRAM 3U
 #define arlogDRAM 65U
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST unsigned short arlogERR_NO_MORE_ENTRY;
 _GLOBAL_CONST unsigned short arlogERR_READ_ASCII_BUFFER;
 _GLOBAL_CONST unsigned short arlogERR_READ_BINARY_BUFFER;
 _GLOBAL_CONST unsigned short arlogERR_INVALID_ENTRY;
 _GLOBAL_CONST unsigned short arlogERR_INVALID_INDEX;
 _GLOBAL_CONST unsigned short arlogERR_READ_BUFFER;
 _GLOBAL_CONST unsigned short arlogERR_READ;
 _GLOBAL_CONST unsigned short arlogERR_WRITE_CALC_DATA;
 _GLOBAL_CONST unsigned short arlogERR_WRITE;
 _GLOBAL_CONST unsigned short arlogERR_NOTEXISTING;
 _GLOBAL_CONST unsigned short arlogERR_NOMEMORY;
 _GLOBAL_CONST unsigned short arlogERR_DELETE;
 _GLOBAL_CONST unsigned short arlogERR_INVALID_IDENT;
 _GLOBAL_CONST unsigned short arlogERR_IN_ACCESS;
 _GLOBAL_CONST unsigned short arlogERR_ACCESS_DENIED;
 _GLOBAL_CONST unsigned short arlogERR_INSTALL;
 _GLOBAL_CONST unsigned short arlogERR_CREATE;
 _GLOBAL_CONST unsigned short arlogERR_EXISTING;
 _GLOBAL_CONST unsigned short arlogERR_ILL_LEN;
 _GLOBAL_CONST unsigned short arlogERR_ILL_PARAM;
 _GLOBAL_CONST unsigned short arlogERR_ILL_LOGLEVEL;
 _GLOBAL_CONST unsigned short arlogERR_ILL_MEMTYPE;
 _GLOBAL_CONST unsigned short arlogERR_ILL_NAME;
 _GLOBAL_CONST unsigned long arlogBASE_REDUND_LOG_IDENT;
 _GLOBAL_CONST unsigned long arlogBASE_SAFETY_LOG_IDENT;
 _GLOBAL_CONST unsigned long arlogBASE_FIELDBUS_LOG_IDENT;
 _GLOBAL_CONST unsigned long arlogBASE_USER_LOG_IDENT;
 _GLOBAL_CONST unsigned long arlogBASE_SYSTEM_LOG_IDENT;
 _GLOBAL_CONST unsigned short arlogMIN_LOGDATA_SIZE;
 _GLOBAL_CONST unsigned long arlogLEVEL_FATAL;
 _GLOBAL_CONST unsigned long arlogLEVEL_WARNING;
 _GLOBAL_CONST unsigned long arlogLEVEL_INFO;
 _GLOBAL_CONST unsigned char arlogUSRROM;
 _GLOBAL_CONST unsigned char arlogUSRRAM;
 _GLOBAL_CONST unsigned char arlogDRAM;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct asarlogRead
{	unsigned long len;
	unsigned long lenBin;
	unsigned long lenAscii;
	unsigned long logLevel;
	unsigned long errornr;
	unsigned char taskName[36];
	unsigned long errYear;
	unsigned long errMonth;
	unsigned long errDay;
	unsigned long errHour;
	unsigned long errMinute;
	unsigned long errSecond;
	unsigned long errMilliSec;
	unsigned long errMicroSec;
} asarlogRead;

typedef struct AsArLogCreate
{
	/* VAR_INPUT (analog) */
	unsigned long pName;
	unsigned long len;
	unsigned long memType;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	/* VAR (analog) */
	unsigned long intResult;
	unsigned long intState;
	unsigned long intRes;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsArLogCreate_typ;

typedef struct AsArLogDelete
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long intResult;
	unsigned long intState;
	unsigned long intRes;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsArLogDelete_typ;

typedef struct AsArLogWrite
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned long logLevel;
	unsigned long errornr;
	unsigned long mem;
	unsigned long len;
	unsigned long asciiString;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long intResult;
	unsigned long intState;
	unsigned long intRes;
	unsigned char intTaskName[36];
	unsigned long intRtkTime[4];
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsArLogWrite_typ;

typedef struct AsArLogRead
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	unsigned long index;
	unsigned long arlogRead;
	unsigned long memBin;
	unsigned long lenBin;
	unsigned long memAscii;
	unsigned long lenAscii;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long intResult;
	unsigned long intState;
	unsigned long intRes;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsArLogRead_typ;

typedef struct AsArLogClear
{
	/* VAR_INPUT (analog) */
	unsigned long ident;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned long intResult;
	unsigned long intState;
	unsigned long intRes;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsArLogClear_typ;

typedef struct AsArLogGetInfo
{
	/* VAR_INPUT (analog) */
	unsigned long pName;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long ident;
	unsigned long len;
	unsigned long memType;
	unsigned long actualIndex;
	unsigned long FormatVer;
	/* VAR (analog) */
	unsigned long intResult;
	unsigned long intState;
	unsigned long intRes;
	/* VAR_INPUT (digital) */
	plcbit enable;
} AsArLogGetInfo_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void AsArLogCreate(struct AsArLogCreate* inst);
_BUR_PUBLIC void AsArLogDelete(struct AsArLogDelete* inst);
_BUR_PUBLIC void AsArLogWrite(struct AsArLogWrite* inst);
_BUR_PUBLIC void AsArLogRead(struct AsArLogRead* inst);
_BUR_PUBLIC void AsArLogClear(struct AsArLogClear* inst);
_BUR_PUBLIC void AsArLogGetInfo(struct AsArLogGetInfo* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ASARLOG_ */

