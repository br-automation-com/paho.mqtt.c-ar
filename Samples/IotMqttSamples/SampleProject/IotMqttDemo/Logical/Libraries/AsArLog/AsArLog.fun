                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsArLogCreate					(*creates an AR logger user module; asynchronous execution*)
	VAR_INPUT
		enable		: BOOL;						(*enables execution*)
		pName		: UDINT;					(*name of the AR logger user module to be created give as a pointer, e.g. "vclog".*)
		len     	: UDINT;					(*length of the log data area*)
		memType    	: UDINT;					(*memory type on the target: arlogDRAM, arlogUSRRAM, arlogUSRROM*)
	END_VAR

	VAR
        intResult	: UDINT;					(*internal variable*)
        intState    : UDINT;					(*internal variable*)
        intRes      : UDINT;					(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		: UINT; 					(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		ident		: UDINT;					(*ident of the AR logger basis module to be generated*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsArLogDelete					(*deletes an AR logger user module; asynchronous execution*)
	VAR_INPUT
		enable		: BOOL;						(*enables execution*)
		ident		: UDINT;					(*ident of the AR logger user module to be deleted*)
	END_VAR

	VAR
        intResult	: UDINT;					(*internal variable*)
        intState    : UDINT;					(*internal variable*)
        intRes      : UDINT;					(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		: UINT; 					(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsArLogWrite						(*writes a log entry to a AR logger user module; asynchronous execution*)
	VAR_INPUT
		enable		: BOOL;						(*enables execution*)
		ident		: UDINT;					(*ident for the AR logger module to be written (user module or base module)*)
		logLevel	: UDINT;					(*log level of the log entry*)
		errornr		: UDINT;					(*error number of the entry*)
		mem			: UDINT;					(*binary log data given as a pointer*)
		len			: UDINT;					(*length of the binary log data in bytes*)
		asciiString	: UDINT;					(*log-specific zero-terminated ASCII string give as a pointer*)
	END_VAR

	VAR
        intResult	: UDINT;					(*internal variable*)
        intState    : UDINT;					(*internal variable*)
        intRes      : UDINT;					(*internal variable*)
		intTaskName	: ARRAY[0..35] OF USINT;	(*internal variable*)
		intRtkTime  : ARRAY[0..3] OF UDINT;		(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		: UINT;  					(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsArLogRead						(*reads a log entry from a AR logger module; asynchronous execution*)
	VAR_INPUT
		enable		: BOOL;						(*enables execution*)
		ident		: UDINT;					(*ident for the AR logger module to be read (user module or base module)*)
		index		: UDINT;					(*index of the log entry to be read*)
		arlogRead	: UDINT;					(*specifies read structure (given as a pointer) where the header data for the log entry can be copied*)
		memBin		: UDINT;					(*buffer for binary log data given as a pointer (if NULL, no binary log data is copied)*)
		lenBin		: UDINT;					(*number of binary log data bytes to be read (if NULL, no binary log data is copied)*)
		memAscii	: UDINT;					(*buffer for ASCII string given as a pointer*)
		lenAscii	: UDINT;					(*number of bytes to be read for the ASCII string*)
	END_VAR

	VAR
        intResult	: UDINT;					(*internal variable*)
        intState    : UDINT;					(*internal variable*)
        intRes      : UDINT;					(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		: UINT;  					(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsArLogClear						(*deletes or reinitializes the log data in an AR logger user module; asynchronous execution*)
	VAR_INPUT
		enable		: BOOL;						(*enables execution*)
		ident		: UDINT;					(*ident of the AR logger user module to be reinitialized*)
	END_VAR

	VAR
        intResult	: UDINT;					(*internal variable*)
        intState    : UDINT;					(*internal variable*)
        intRes      : UDINT;					(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		: UINT; 					(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK AsArLogGetInfo					(*reads information from a self-generated AR logger user module or AR logger base user module*)
	VAR_INPUT
		enable		: BOOL;						(*enables execution*)
		pName		: UDINT;					(*name of the AR logger user module (e.g. "vclog") given as a pointer*)
	END_VAR

	VAR
        intResult	: UDINT;					(*internal variable*)
        intState    : UDINT;					(*internal variable*)
        intRes      : UDINT;					(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status		: UINT;						(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, 0xXXXX = see help*)
		ident		: UDINT;					(*ident of the AR logger BR module*)
		len	    	: UDINT;					(*length of the log data area*)
		memType		: UDINT;					(*memory type on the target*)
		actualIndex	: UDINT;					(*current entry index in the specified AR logger BR module*)
		FormatVer   : UDINT;					(*version of de log data format*)

	END_VAR
END_FUNCTION_BLOCK
