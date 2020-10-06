
 TYPE
	ArCertDetailsType : STRUCT				(*certificate details*)
		Name			: STRING[255]; 			(*certificate name*)
		Issuer			: STRING[255];			(*issuer (CN)*)
		Subject			: STRING[255];			(*subject (CN)*)		
		ValidFrom		: DTStructure;			(*valid from date*)
		ValidTo			: DTStructure;			(*valid to date*)
		Version			: DINT;					(*version*)
		SerialNumber	: STRING[39];			(*serial number*)
	END_STRUCT;

	ArCertCRLDetailsType : STRUCT			(*detail information of a certificate revocation list (CRL)*)
		Name			: STRING[255]; 			(*CRL name*)
		Issuer			: STRING[255]; 			(*issuer*)
		EffectiveDate	: DTStructure;			(*effective date*)
		NextUpdate		: DTStructure;			(*next update*)
		Version			: DINT;					(*version*)
		CRLNumber      	: STRING[39]; 			(*CRL number*)
	END_STRUCT;
	
    ArCertKeySizeEnum : 
        (
            arCERT_KEY_SIZE_1024_BITS := 1,		(*encryption with a key with 1024 bits*)
            arCERT_KEY_SIZE_2048_BITS := 2,		(*encryption with a key with 2048 bits*)
            arCERT_KEY_SIZE_4096_BITS := 3		(*encryption with a key with 4096 bits*)
        );
		
    ArCertAsyncInternalType : STRUCT
        FBStateCtx		: ArFBStateInternalType;
		AsyFuMaCtx		: ArFBAsyFuMaInternalType;
    END_STRUCT;
END_TYPE
