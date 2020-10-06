/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _ARCERT_
#define _ARCERT_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#include <runtime.h>
#include <astime.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define arCERT_ERR_URI_INVALID (-1070585784)
 #define arCERT_ERR_VALID_TIME_INVALID (-1070585785)
 #define arCERT_ERR_COUNTRY_CODE_INVALID (-1070585786)
 #define arCERT_ERR_KEY_SIZE_INVALID (-1070585787)
 #define arCERT_ERR_PRIVATE_KEY_INVALID (-1070585788)
 #define arCERT_ERR_DATA_SIZE_INVALID (-1070585789)
 #define arCERT_ERR_DATA_NULL (-1070585790)
 #define arCERT_ERR_NAME_INVALID (-1070585791)
 #define arCERT_ERR_CERT_NAME_TOO_LONG (-1070585792)
 #define arCERT_ERR_CERTIFICATE_EXISTS (-1070585793)
 #define arCERT_ERR_BUFFER_SIZE (-1070585794)
 #define arCERT_ERR_INTERNAL (-1070585795)
 #define arCERT_ERR_CERTIFICATE_NOT_FOUND (-1070585796)
#else
 #ifndef _GLOBAL_CONST
   #define _GLOBAL_CONST _WEAK const
 #endif
 _GLOBAL_CONST signed long arCERT_ERR_URI_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_VALID_TIME_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_COUNTRY_CODE_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_KEY_SIZE_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_PRIVATE_KEY_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_DATA_SIZE_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_DATA_NULL;
 _GLOBAL_CONST signed long arCERT_ERR_NAME_INVALID;
 _GLOBAL_CONST signed long arCERT_ERR_CERT_NAME_TOO_LONG;
 _GLOBAL_CONST signed long arCERT_ERR_CERTIFICATE_EXISTS;
 _GLOBAL_CONST signed long arCERT_ERR_BUFFER_SIZE;
 _GLOBAL_CONST signed long arCERT_ERR_INTERNAL;
 _GLOBAL_CONST signed long arCERT_ERR_CERTIFICATE_NOT_FOUND;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum ArCertKeySizeEnum
{	arCERT_KEY_SIZE_1024_BITS = 1,
	arCERT_KEY_SIZE_2048_BITS = 2,
	arCERT_KEY_SIZE_4096_BITS = 3
} ArCertKeySizeEnum;

typedef struct ArCertDetailsType
{	plcstring Name[256];
	plcstring Issuer[256];
	plcstring Subject[256];
	struct DTStructure ValidFrom;
	struct DTStructure ValidTo;
	signed long Version;
	plcstring SerialNumber[40];
} ArCertDetailsType;

typedef struct ArCertCRLDetailsType
{	plcstring Name[256];
	plcstring Issuer[256];
	struct DTStructure EffectiveDate;
	struct DTStructure NextUpdate;
	signed long Version;
	plcstring CRLNumber[40];
} ArCertCRLDetailsType;

typedef struct ArCertAsyncInternalType
{	struct ArFBStateInternalType FBStateCtx;
	struct ArFBAsyFuMaInternalType AsyFuMaCtx;
} ArCertAsyncInternalType;

typedef struct ArCertImportOwn
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertImportOwn_typ;

typedef struct ArCertExportOwn
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long NeededDataSize;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertExportOwn_typ;

typedef struct ArCertDeleteOwn
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertDeleteOwn_typ;

typedef struct ArCertImportThirdParty
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertImportThirdParty_typ;

typedef struct ArCertExportThirdParty
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long NeededDataSize;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertExportThirdParty_typ;

typedef struct ArCertDeleteThirdParty
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertDeleteThirdParty_typ;

typedef struct ArCertImportPrivateKey
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertImportPrivateKey_typ;

typedef struct ArCertExportPrivateKey
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long NeededDataSize;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertExportPrivateKey_typ;

typedef struct ArCertDeletePrivateKey
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertDeletePrivateKey_typ;

typedef struct ArCertImportCRL
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertImportCRL_typ;

typedef struct ArCertExportCRL
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Data;
	unsigned long DataSize;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	unsigned long NeededDataSize;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertExportCRL_typ;

typedef struct ArCertDeleteCRL
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertDeleteCRL_typ;

typedef struct ArCertGenerate
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	plcstring PrivateKeyName[256];
	enum ArCertKeySizeEnum KeySize;
	plcstring CountryCode[10];
	plcstring StateProvince[514];
	plcstring Locality[514];
	plcstring Organization[256];
	plcstring OrganizationUnit[256];
	plcstring ContactEmail[514];
	plcstring CommonName[256];
	unsigned long ValidTimeSeconds;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertGenerate_typ;

typedef struct ArCertGenerateOpcUA
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	plcstring PrivateKeyName[256];
	plcstring PrivateKeyPassword[256];
	enum ArCertKeySizeEnum KeySize;
	plcstring CountryCode[10];
	plcstring StateProvince[514];
	plcstring Locality[514];
	plcstring Organization[256];
	plcstring OrganizationUnit[256];
	plcstring ContactEmail[514];
	plcstring CommonName[256];
	unsigned long ValidTimeSeconds;
	plcstring URI[256];
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertGenerateOpcUA_typ;

typedef struct ArCertGetOwnDetails
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArCertDetailsType Details;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertGetOwnDetails_typ;

typedef struct ArCertGetThirdPartyDetails
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArCertDetailsType Details;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertGetThirdPartyDetails_typ;

typedef struct ArCertGetCRLDetails
{
	/* VAR_INPUT (analog) */
	plcstring Name[256];
	unsigned long Index;
	/* VAR_OUTPUT (analog) */
	signed long StatusID;
	struct ArCertCRLDetailsType Details;
	/* VAR (analog) */
	struct ArCertAsyncInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit Error;
} ArCertGetCRLDetails_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void ArCertImportOwn(struct ArCertImportOwn* inst);
_BUR_PUBLIC void ArCertExportOwn(struct ArCertExportOwn* inst);
_BUR_PUBLIC void ArCertDeleteOwn(struct ArCertDeleteOwn* inst);
_BUR_PUBLIC void ArCertImportThirdParty(struct ArCertImportThirdParty* inst);
_BUR_PUBLIC void ArCertExportThirdParty(struct ArCertExportThirdParty* inst);
_BUR_PUBLIC void ArCertDeleteThirdParty(struct ArCertDeleteThirdParty* inst);
_BUR_PUBLIC void ArCertImportPrivateKey(struct ArCertImportPrivateKey* inst);
_BUR_PUBLIC void ArCertExportPrivateKey(struct ArCertExportPrivateKey* inst);
_BUR_PUBLIC void ArCertDeletePrivateKey(struct ArCertDeletePrivateKey* inst);
_BUR_PUBLIC void ArCertImportCRL(struct ArCertImportCRL* inst);
_BUR_PUBLIC void ArCertExportCRL(struct ArCertExportCRL* inst);
_BUR_PUBLIC void ArCertDeleteCRL(struct ArCertDeleteCRL* inst);
_BUR_PUBLIC void ArCertGenerate(struct ArCertGenerate* inst);
_BUR_PUBLIC void ArCertGenerateOpcUA(struct ArCertGenerateOpcUA* inst);
_BUR_PUBLIC void ArCertGetOwnDetails(struct ArCertGetOwnDetails* inst);
_BUR_PUBLIC void ArCertGetThirdPartyDetails(struct ArCertGetThirdPartyDetails* inst);
_BUR_PUBLIC void ArCertGetCRLDetails(struct ArCertGetCRLDetails* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ARCERT_ */

