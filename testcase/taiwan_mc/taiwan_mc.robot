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
${GATEWAY}             990200000000269c
${COMMAND_INTERVAL}    5m
${EID}                 7ff9011020000001
@{MC_EIDS}             7ff9011020000001    7ff9011020000002    7ff9011020000003    7ff9011020000004    7ff9011020000005
...                    7ff9011020000008    7ff9011020000009    7ff9011020000010    7ff9011020000011    7ff9011020000012
...                    7ff9011020000013    7ff9011020000014    7ff9011020000015    7ff9011020000017    7ff9011020000018
...                    7ff9011020000019    7ff9011020000021    7ff9011020000022    7ff9011020000023    7ff9011020000024
...                    7ff9011020000025    7ff9011020000026    7ff9011020000027    7ff9011020000029    7ff9011020000030
...                    7ff9011020000031    7ff9011020000032    7ff9011020000083    7ff9011020000084    7ff9011020000088
...                    7ff9011020000089    7ff9011020000090    7ff9011020000091    7ff9011020000093    7ff9011020000094
...                    7ff9011020000095    7ff9011020000096    7ff9011020000097    7ff9011020000098    7ff9011020000099
...                    7ff9011020000100

*** Test Cases ***
Demo1
    Select GateWay    ${GATEWAY}

    : For    ${x}    In Range    1    500
    \    Log to console    Currently is running ${x} time.
    \    Loop For All NICs    GET_METER_TYPE
    \    Loop For All NICs    GET_METER_SUMMATION_DELIVERED
    \    Loop For All NICs    GET_METER_GAS_VALVE_STATE
    \    Loop For All NICs    GET_SUMMATION_REPORT_INTERVAL
    \    Loop For All NICs    GET_METER_VERSION
    \    Loop For All NICs    GET_METER_READING_VALUE
    \    Loop For All NICs    GET_METER_STATUS
    \    Loop For All NICs    GET_METER_CUSTOMERID
    \    Loop For All NICs    GET_METER_TIME
    \    Loop For All NICs    GET_PROTOCOL_VERSION

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
