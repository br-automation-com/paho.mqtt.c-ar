
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertImportOwn   				(*imports an existing own certificate from buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the own certificate*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to certificate data*) (**) (*#PAR*)
		DataSize 		: UDINT;			(*size of certificate data*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertExportOwn  				(*exports an own certificate to a buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the own certificate*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to buffer for exported certificate data*) (**) (*#PAR*)
		DataSize		: UDINT;			(*buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		NeededDataSize 	: UDINT;			(*needed buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertDeleteOwn  				(*deletes an own certificate*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the own certificate*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertImportThirdParty   				(*imports an existing third party certificate from buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the third party certificate*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to certificate data*) (**) (*#PAR*)
		DataSize 		: UDINT;			(*size of certificate data*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertExportThirdParty  				(*exports a third party certificate to a buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the third party certificate*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to buffer for exported certificate data*) (**) (*#PAR*)
		DataSize		: UDINT;			(*buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		NeededDataSize 	: UDINT;			(*needed buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertDeleteThirdParty  				(*deletes a third party certificate*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the third party certificate*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertImportPrivateKey		(*imports an existing private key from buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the private key*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to private key data*) (**) (*#PAR*)
		DataSize 		: UDINT;			(*size of private key data*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertExportPrivateKey  		(*exports a private key to a buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the private key*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to buffer for exported private key data*) (**) (*#PAR*)
		DataSize		: UDINT;			(*buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		NeededDataSize 	: UDINT;			(*needed buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertDeletePrivateKey		(*deletes a private key*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the private key*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertImportCRL 				(*imports a certificate revocation list from buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the certificate revocation list*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to certificate data*) (**) (*#PAR*)
		DataSize 		: UDINT;			(*size of certificate data*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertExportCRL 				(*exports a certificate revocation list to a buffer*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the certificate revocation list*) 	(**) (*#PAR*)
		Data			: UDINT; 			(*pointer to buffer for exported CRL data*) (**) (*#PAR*)
		DataSize		: UDINT;			(*buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		NeededDataSize : UDINT;				(*needed buffer size*) 				(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertDeleteCRL  			(*deletes a certificate revocation list*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the certificate revocation list*) 	(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertGenerate       		(*generates a self-signed certificate and a private key*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the certificate*) 	(**) (*#PAR*)
		PrivateKeyName 	: STRING[255];		(*name of the private key*) 	(**) (*#PAR*)
		KeySize 		: ArCertKeySizeEnum;(*size of key for certificate generation*) 	(**) (*#PAR*)
		CountryCode		: STRING[9];		(*country code*)		 		(**) (*#PAR*)
		StateProvince	: STRING[513];		(*state*) 						(**) (*#PAR*)
		Locality		: STRING[513];		(*locality*) 					(**) (*#PAR*)
		Organization 	: STRING[255];		(*organization*) 				(**) (*#PAR*)
		OrganizationUnit: STRING[255];		(*organization unit*) 			(**) (*#PAR*)
		ContactEmail 	: STRING[513];		(*contact email*)			 	(**) (*#PAR*)
		CommonName 		: STRING[255];		(*common name*) 				(**) (*#PAR*)
		ValidTimeSeconds : UDINT;			(*valid time in seconds*)		(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertGenerateOpcUA		(*generates a self-signed certificate and a private key*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the certificate*) 	(**) (*#PAR*)
		PrivateKeyName 	: STRING[255];		(*name of the private key*) 	(**) (*#PAR*)
		PrivateKeyPassword : STRING[255];	(*password of the private key*) (**) (*#PAR*)
		KeySize 		: ArCertKeySizeEnum;(*size of key for certificate generation*) 	(**) (*#PAR*)
		CountryCode		: STRING[9];		(*country code*)		 		(**) (*#PAR*)
		StateProvince	: STRING[513];		(*state*) 						(**) (*#PAR*)
		Locality		: STRING[513];		(*locality*) 					(**) (*#PAR*)
		Organization 	: STRING[255];		(*organization*) 				(**) (*#PAR*)
		OrganizationUnit: STRING[255];		(*organization unit*) 			(**) (*#PAR*)
		ContactEmail 	: STRING[513];		(*contact email*)			 	(**) (*#PAR*)
		CommonName 		: STRING[255];		(*common name*) 				(**) (*#PAR*)
		ValidTimeSeconds : UDINT;			(*valid time in seconds*)		(**) (*#PAR*)
		URI				: STRING[255];		(*URI*) 						(**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertGetOwnDetails   			(*gets details of an own certificate*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the own certificate*) 	(**) (*#PAR*)
		Index			: UDINT;			(*index of the certificate*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		Details			: ArCertDetailsType;(*certificate details*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertGetThirdPartyDetails   			(*gets details of a third party certificate*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the third party certificate*) 	(**) (*#PAR*)
		Index			: UDINT;			(*index of the certificate*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		Details			: ArCertDetailsType;(*certificate details*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK ArCertGetCRLDetails			(*gets details of a certificate revocation list*)
	VAR_INPUT
		Execute			: BOOL; 			(*starts execution*) 			(**) (*#PAR*)
		Name 			: STRING[255];		(*name of the certificate revocation list*) 	(**) (*#PAR*)
		Index			: UDINT;			(*index of the certificate revocation list*) (**) (*#PAR*)
	END_VAR
	VAR_OUTPUT
		Done			: BOOL;				(*execution done*) 				(**) (*#PAR*)
		Busy			: BOOL;				(*execution running*) 			(**) (*#PAR*)
		Error			: BOOL;				(*execution failed*) 			(**) (*#PAR*)
		StatusID		: DINT;  			(*execution error: see help*) 	(**) (*#PAR*)
		Details			: ArCertCRLDetailsType;	(*certificate revocation list details*)
	END_VAR
	VAR
		Internal		: ArCertAsyncInternalType;	(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK
