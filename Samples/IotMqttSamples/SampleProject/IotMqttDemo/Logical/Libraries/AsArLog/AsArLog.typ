                                                                      
 TYPE
    asarlogRead : STRUCT
        len             : UDINT;					(*length of the entire log entry (header + binary log data + ASCII string)*)
		lenBin          : UDINT;					(*length of the binary log data*)
		lenAscii        : UDINT;					(*length of the ASCII log data*)
		logLevel        : UDINT;					(*log level of the log entry*)
		errornr         : UDINT;					(*error number of the entry*)
		taskName		: ARRAY[0..35] OF USINT;	(*task name*)
		errYear         : UDINT;					(*year (date of error)*)
		errMonth        : UDINT;					(*month (date of error)*)
		errDay          : UDINT;					(*day (date of error)*)
		errHour         : UDINT;					(*hour (time of error)*)
		errMinute       : UDINT;					(*minute (time of error)*)
		errSecond       : UDINT;					(*second (time of error)*)
		errMilliSec     : UDINT;					(*millisecond (time of error)*)
		errMicroSec     : UDINT;					(*microsecond (time of error)*)
	END_STRUCT;
END_TYPE

