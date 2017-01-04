*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     ../../Resources/mylibs.py
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${FMS_URL}             http://lora-yl-admin.cloud.freestyleiot.com/   # Dev Envionment
${USERNAME}            freestyle
${PASSWORD}            treadstone3
${GATEWAY}             990200000000269b
${COMMAND_INTERVAL}    5m
${EID}                 7ff9011020000034
@{MC_EIDS}             7ff9011020000034    7ff9011020000035    7ff9011020000036    7ff9011020000037    7ff9011020000038
...                    7ff9011020000039    7ff9011020000040    7ff9011020000042    7ff9011020000044    7ff9011020000045
...                    7ff9011020000046    7ff9011020000047    7ff9011020000048    7ff9011020000049    7ff9011020000051
...                    7ff9011020000052    7ff9011020000053    7ff9011020000054    7ff9011020000055    7ff9011020000056
...                    7ff9011020000057    7ff9011020000058    7ff9011020000059    7ff9011020000060    7ff9011020000061
...                    7ff9011020000063    7ff9011020000064    7ff9011020000065    7ff9011020000067    7ff9011020000068
...                    7ff9011020000069    7ff9011020000070    7ff9011020000071    7ff9011020000072    7ff9011020000073
...                    7ff9011020000074    7ff9011020000075    7ff9011020000076    7ff9011020000077    7ff9011020000080
...                    7ff9011020000082

*** Test Cases ***
Demo1
    Select GateWay    ${GATEWAY}

    : For    ${x}    In Range    1    500
    \    Log to console    Currently is running ${x} time.
    \    Loop For All NICs    GET_METER_TYPE
    \    Loop For All NICs    GET_METER_SUMMATION_DELIVERED
    \    Loop For All NICs    GET_METER_CURRENT_PRESSURE
    \    Loop For All NICs    GET_METER_GAS_VALVE_STATE
    \    Loop For All NICs    GET_SUMMATION_REPORT_INTERVAL
    \    Loop For All NICs    GET_PRESSURE_REPORT_INTERVAL
    \    Loop For All NICs    GET_METER_VERSION
    \    Loop For All NICs    GET_OFLOW_DETECT_ENABLE
    \    Loop For All NICs    GET_OFLOW_DETECT_DURATION
    \    Loop For All NICs    GET_OFLOW_DETECT_RATE
    \    Loop For All NICs    GET_PRESSURE_ALARM_LEVEL_LOW
    \    Loop For All NICs    GET_PRESSURE_ALARM_LEVEL_HIGH
    \    Loop For All NICs    GET_LEAK_DETECT_RANGE
    \    Loop For All NICs    GET_MANUAL_RECOVER_ENABLE
    \    Loop For All NICs    GET_METER_FIRMWARE_VERSION
    \    Loop For All NICs    GET_METER_SHUTOFF_CODES
    \    Loop For All NICs    GET_ELECTRIC_QNT_VALUE
    \    Loop For All NICs    GET_COMMS_MODE
    \    Loop For All NICs    GET_PILOT_LIGHT_MODE
    \    Loop For All NICs    GET_EARTHQUAKE_SENSOR_STATE

*** Keywords ***
Loop For All NICs
    [Arguments]    ${COMMAND}
    : FOR    ${x}    IN     @{MC_EIDS}
    \    Select Specified EID of Main Page    ${x}    ${COMMAND}
    Sleep    ${COMMAND_INTERVAL}

Select Specified EID of Main Page
    [Arguments]    ${device_eid}    ${command}
    Wait Until Element Is Visible    xpath=//table[contains(@id, "flexi-devices")]//div[contains(text(), "${EID}")]
    Click Element    xpath=//table[contains(@id, "flexi-devices")]//div[contains(text(), "${EID}")]
    Click Execute Button
    Input Device ID    ${device_eid}
    Input Command    ${command}
    Click Send Button
    Click OK Button
