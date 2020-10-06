                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EthStat					(*retrieves an interface's statistics; asynchronous execution*)
	VAR_INPUT
		enable			: BOOL;			(*enables execution*)
		pDevice			: UDINT;		(*device name given as a pointer*)
		pStat			: UDINT;		(*pointer to the statistic structure ethSTATISTICS_typ*)
	END_VAR

	VAR_OUTPUT
		status			: UINT;			(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR

	VAR
        i_state			: UINT;			(*internal variable*)
		i_result		: UINT;			(*internal variable*)
        i_tmp			: UDINT;		(*internal variable*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION ethInetAton : UINT				(*converts an IP address from internet-format to binary value*)
	VAR_INPUT
		pIpStr		:UDINT;				(*address of the IP address (internet-format)*)
		pIpAdr		:UDINT;				(*address where to store the binary value (network order) of the IP address*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION ethInetNtoa : UINT				(*converts an IP address from binary value to internet-format*)
	VAR_INPUT
		ipAdr		:UDINT;				(*binary value (network order) of the IP address*)
		pIpStr		:UDINT;				(*address where to store the internet-format string of the IP address*)
	END_VAR
END_FUNCTION
