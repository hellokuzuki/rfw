*** Settings ***
Library             DateTime
Library             ../../Resources/validationLib.py
Resource            ../../Resources/keywords.robot
Resource            ../../Resources/variables.robot
Suite Setup         Run Test Suite Setup Process    ${FMS_URL}    FireFox    ${USERNAME}    ${PASSWORD}
Suite Teardown      Run Test Suite Teardown Process
Test Teardown       Run Test Case Teardown Process

*** Variables ***
@{ylnics}    7ff9011202000004    7ff9011202000005    7ff9011202000006    7ff9011202000007    7ff9011202000012
...          7ff9011202000013    7ff9011202000014    7ff9011202000015    7ff9011202000016    7ff9011202000017
#...              7ff9011202000009    7ff9010926000013    7ff9011202000018    7ff9011202000019    7ff9011202000020
@{mcnics}        7ff9011202000009    7ff9011202000018    7ff9011202000019

${FMS_URL}          http://10.10.10.125:83  #http://mwlora-admin.test.freestyleiot.com/     # Mark's Testing Switch
${USERNAME}         freestyle
${PASSWORD}         freestyle


*** Test Cases ***
Demo
    Select GateWay      990200000000269f
    : For    ${index}    In Range    1    100
    \    Log To Console    ${index}
    \    Send Out Command To Multiple EIDs    SET_METER_GAS_VALVE_STATE    valve_state=1     7ff9011110000011
    \    Sleep    15m
    \    Send Out Command To Multiple EIDs    SET_METER_GAS_VALVE_STATE    valve_state=0    7ff9011110000011
    \    Sleep    15m






