# paho.mqtt.c-ar
MQTT Client Library for Automation Runtime based on eclipse/paho.mqtt.c

## Introduction

This repository includes compiled binary MQTT client libraries for Automation Runtime. The libraries are based on 
- OpenSSL 1.1.g
- paho.mqtt.c 1.3.5

The libraries come in two different forms

- IotMqtt

    IotMqtt is a Function Block based Library with Publish and Subscribe functionality that enables easy usage within
    the CYCLIC IEC environment. Basically this is what you need when you want to communicate with a broker using MQTT.
    The client is base on the `MQTTAsync` which is capable of running multiple simultaneous connections on the same
    PLC.


- PahoMQTT

    PahoMQTT is the static library with direct access to the paho.mqtt.c API which is used by the IotMqtt library as a driver. 
    The PahoMQTT library should only be used in special cases, where you need to enable special commands from the mqtt stack.
    It offers basic compatibility for projects that have previously been using PahoMQTT from the 
    https://github.com/br-automation-com/PahoMQTT_Library repository, whereas some minor modifications are needed for these
    applications. Please see Compatibility with Older PahoMQTT versions for more info on this.


## Version Information

The libraries have been built for following runtime versions:
- A4.73 Intel / ARM
- C4.63 Intel / ARM
- D4.53 Intel / ARM
- N4.34 Intel / ARM
- M4.26 Intel
- H3.10 Intel

### Releases

- rev.01
    First release


## Usage

The IotMqtt enables simple usage within IEC programs. Here is a simple sample:

    PROGRAM INIT
    END_PROGRAM
    ...

### File Devices and Certificates

IOTMQTT

### Logfiles


## Compatibility with older PahoMQTT versions

As mentioned in the introduction, the PahoMQTT library offers basic compatibility with older versions of the library.

### Static Linking
One main difference is that the new version only comes as a static library, meaning you need to link you task towards
the archive files in the `SG4` or `SG4/Arm` directory of the library.

### Function Blocks
As the libary only comes as an archive, the `PahoMQTT_Cyclic` and `PahoMQTT_Init` cannot be declared inside the `.var` file
anymore and need to be declared inside the c-code. Further, the `PahoMQTT.h` is not part of the `<AsDefaults.h>` but need
to be specifically included.

Example:

    #include <bur/plctypes.h>
    #include "PahoMQTT.h"

    #ifdef _DEFAULT_INCLUDES
        #include <AsDefault.h>
    #endif

    void sample(unsigned long param_adr);

    _LOCAL PahoMQTT_Init_typ PahoMQTT_Init_0;
    _LOCAL PahoMQTT_Cyclic_typ PahoMQTT_Cyclic_0;


### File Devices and Certificates

File devices work in the same way as for IotMqtt, with the difference that the former `CERTS` filedevice is used as a default file device,
to maintain compatibility with the former PahoMQTT. If you need to access files from other devices, you should use `//DEVICENAME/path/filename.ext`.

### Logging

If the Logger is activated, the output is no longer directed to the AR logger, but placed inside a `PahoMQTTLog.txt` located under the `CERTS` filedevice.
This logfile uses the standard Paho output file format, and has unix lineendings (LF instead of CRLF). Therefore open the logfile in an editor that can understand
that format, like Notepad++.

Example of the `PahoMQTTLog.txt`

    =========================================================
                   Trace Output
    =========================================================
    =========================================================
                    Trace Output
    Product name: Eclipse Paho Synchronous MQTT C Client Library
    Version: 1.3.5
    Build level: 2020-09-15 21:58
    OpenSSL version: OpenSSL 1.1.1g  21 Apr 2020
    OpenSSL flags: -DBR_AUTOMATION_RUNTIME
    OpenSSL build timestamp: 2020-09-01
    OpenSSL platform: BR_AUTOMATIONRUNTIME
    OpenSSL directory: OPENSSLDIR: "//OSSLROOT"
    =========================================================
    20201001 114500.061 2176 SamplePara -> PUBLISH msgid: 100 qos: 1 retained: 0 rc 0 payload len(18): Hello World plain!
    20201001 114500.061 2176 SamplePara <- PUBACK msgid: 100
    20201001 114500.361 2176 SamplePara -> PUBLISH msgid: 101 qos: 1 retained: 0 rc 0 payload len(18): Hello World plain!
    20201001 114500.361 2176 SamplePara <- PUBACK msgid: 101
    20201001 114500.681 2176 SamplePara -> PUBLISH msgid: 102 qos: 1 retained: 0 rc 0 payload len(18): Hello World plain!
    20201001 114500.681 2176 SamplePara <- PUBACK msgid: 102
    20201001 114500.981 2176 SamplePara -> PUBLISH msgid: 103 qos: 1 retained: 0 rc 0 payload len(18): Hello World plain!
    20201001 114500.981 2176 SamplePara <- PUBACK msgid: 103

The former PahoMQTT also contained basic Log functionality which has been removed completely. If you need to fill anything 
into the Paho logfile alongside other loggings as you might previosly have done using the `PahoLog..` functions, simply use:

    fprintf(stdout, "here is my result:%i", res);
