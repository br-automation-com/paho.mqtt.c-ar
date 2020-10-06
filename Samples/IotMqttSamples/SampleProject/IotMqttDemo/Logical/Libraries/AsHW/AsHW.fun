                                                                      
{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwGetBatteryInfo	(*evaluates a device's battery state; asynchronous execution*)
	VAR_INPUT
	    enable      : BOOL; 	(*enables execution*)
		pDevice	    : UDINT;	(*device name given as a pointer, e.g., "SL0.SS0.HW"*)
		ordinal     : USINT;	(*ordinal number of the hardware element: 1 = battery in the backplane, 2 = battery in the CPU*)
	END_VAR

	VAR
        i_state     : UINT;		(*internal variable*)
        i_result    : UINT;		(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status	    : UINT; 	(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		state	    : USINT;	(*battery status: ASHW_BATTERY_LOW, ASHW_BATTERY_OK, ASHW_BATTERY_NOTEST, ASHW_BATTERY_MISSING*) 
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwGetTemperature	(*evaluates the temperature state; asynchronous execution*)
	VAR_INPUT
		enable      : BOOL; 	(*enables execution*)
		pDevice	    : UDINT; 	(*device name given as a pointer, e.g., "SL0.SS0.HW"*)
		ordinal	    : USINT;	(*ordinal number of the hardware element: 1 = cooling plate temperature, 2 = module temperature*)
	END_VAR

	VAR
		i_state     : UINT;		(*internal variable*)
        i_result    : UINT;		(*internal variable*)
	END_VAR

	VAR_OUTPUT
	    status	    : UINT; 	(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
        temperature : UDINT;	(*temperature [1/10°C]*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwGetMode		(*evaluates the mode switch position; asynchronous execution*)
	VAR_INPUT
		enable      : BOOL; 	(*enables execution*)
		pDevice	    : UDINT; 	(*device name given as a pointer, e.g., "SL0.SS0.HW"*)
		ordinal	    : USINT;	(*ordinal number of the hardware element (default 1)*)
	END_VAR

	VAR
		i_state     : UINT;		(*internal variable*)
        i_result    : UINT;		(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status      : UINT; 	(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
        mode        : USINT;	(*mode switch*)
	END_VAR

END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwGetNode		(*evaluates the node switch position; asynchronous execution*)
	VAR_INPUT
		enable      : BOOL; 	(*enables execution*)
		pDevice	    : UDINT; 	(*device name given as a pointer, e.g., "SL0.SS0.HW"*)
		ordinal	    : USINT;	(*ordinal number of the hardware element (default 1)*)
	END_VAR

	VAR
        i_state     : UINT;		(*internal variable*)
		i_result    : UINT;		(*internal variable*)
        i_reserve   : UDINT;	(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status      : UINT; 	(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
        node        : USINT;	(*node number (decimal)*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwSetUserLED		(*operates user LEDs; asynchronous execution*)
	VAR_INPUT
		enable      : BOOL; 	(*enables execution*)
		pDevice	    : UDINT; 	(*device name given as a pointer, e.g., "SL0.SS0.HW"*)
		ordinal	    : USINT;	(*ordinal number of the hardware element, e.g., PPx00 -> ordinal = 1*)
		value	    : USINT;	(*1 =  sets user LED (ASHW_USER_LED_ON), 0 =  clears user LED*)
	END_VAR

	VAR
        i_state     : UINT;		(*internal variable*)
        i_result    : UINT;		(*internal variable*)
	END_VAR

	VAR_OUTPUT
		status	    : UINT; 	(*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
	END_VAR	
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION HwSetBeep : UINT		(*operates the internal speaker*)
	VAR_INPUT
		frequency	:UDINT;		(*beep frequency Hz (40 - 15000)*)
		beepTime	:UDINT;		(*beep duration msec (minimum 10msec)*)
	END_VAR
END_FUNCTION

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwGetCfSerialNumber   (*gets the serial number of the compact flash; asynchronous execution*)
	VAR_INPUT
		enable : BOOL;
		pDevice	    : UDINT; 	     (*device name given as a pointer, e.g., "SL0.SS0.HW"*)
		ordinal	    : USINT;	     (*ordinal number of the hardware element*)
	END_VAR
	
	VAR
        i_state     : UINT;		(*internal variable*)
        i_result    : UINT;		(*internal variable*)
	END_VAR
	
	VAR_OUTPUT
	    status	    : UINT; 	     (*execution status: ERR_OK, ERR_FUB_ENABLE_FALSE, ERR_FUB_BUSY, 0xXXXX = see help*)
		cfSerialNumber : STRING[31]; (*the serial number of the compact flash*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_CONTEXT} {REDUND_UNREPLICABLE} FUNCTION_BLOCK HwGetCfPluggedInfo   (*retrieve information whether the CF is plugged *)
	VAR_INPUT
		enable : BOOL;
	END_VAR
	
	VAR
        i_state     : UINT;		(*internal variable*)
        i_result    : UINT;		(*internal variable*)
	END_VAR
	
	VAR_OUTPUT
	    status	    : UINT; 	(*execution status: ERR_OK, ERR_NOTIMPLEMENTED *)
		isPlugged : BOOL;		(* TRUE if CF is plugged, FALSE otherwise *)
	END_VAR
END_FUNCTION_BLOCK
