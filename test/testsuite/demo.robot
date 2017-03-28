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
    \    Send Out Command To Multiple EIDs    GET_METER_FIRMWARE_VERSION    ${EMPTY}      7ff9011202000005
    \    Sleep    15m














    # Send Out Command To Multiple EIDs    SET_PRESSURE_REPORT_INTERVAL    report_interval_mins=1440    7ff9011110000004
    # Wait And Validate Response Of Command    SET_PRESSURE_REPORT_INTERVAL    7ff9011110000004    report_interval_mins=1440
    # Send Out Command To Multiple EIDs    GET_PRESSURE_REPORT_INTERVAL    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_PRESSURE_REPORT_INTERVAL    7ff9011110000004    report_interval_mins=1440


    # Send Out Command To Multiple EIDs    GET_METER_VERSION    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_METER_VERSION    7ff9011110000004    1.0.12-STB


    # Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_ENABLE    overflow_detect_enable=0    7ff9011110000004
    # Wait And Validate Response Of Command    SET_OFLOW_DETECT_ENABLE    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_ENABLE    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_OFLOW_DETECT_ENABLE    7ff9011110000004    overflow_detect_enable=0

    # Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=1234    7ff9011110000004
    # Wait And Validate Response Of Command    SET_OFLOW_DETECT_DURATION    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_DURATION    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_OFLOW_DETECT_DURATION    7ff9011110000004    overflow_detect_duration=1234

    # Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=43    7ff9011110000004
    # Wait And Validate Response Of Command    SET_OFLOW_DETECT_RATE    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_RATE    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_OFLOW_DETECT_RATE    7ff9011110000004    overflow_detect_flowrate=43

    # Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_high=3    7ff9011110000004
    # Wait And Validate Response Of Command    SET_PRESSURE_ALARM_LEVEL_LOW    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_LOW    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_PRESSURE_ALARM_LEVEL_LOW    7ff9011110000004    pressure_alarm_level_high=3

    # Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_HIGH    pressure_alarm_level_high=4    7ff9011110000004
    # Wait And Validate Response Of Command    SET_PRESSURE_ALARM_LEVEL_HIGH    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_HIGH    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_PRESSURE_ALARM_LEVEL_HIGH    7ff9011110000004    pressure_alarm_level_high=4

    # Send Out Command To Multiple EIDs    SET_LEAK_DETECT_RANGE    leak_detect_range=8    7ff9011110000004
    # Wait And Validate Response Of Command    SET_LEAK_DETECT_RANGE    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_LEAK_DETECT_RANGE    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_LEAK_DETECT_RANGE    7ff9011110000004    leak_detect_range=8

    # Send Out Command To Multiple EIDs    SET_MANUAL_RECOVER_ENABLE    validate_get_manual_recover_enable=1    7ff9011110000004
    # Wait And Validate Response Of Command    SET_MANUAL_RECOVER_ENABLE    7ff9011110000004
    # Send Out Command To Multiple EIDs    GET_MANUAL_RECOVER_ENABLE    ${EMPTY}    7ff9011110000004
    # Wait And Validate Response Of Command    GET_MANUAL_RECOVER_ENABLE    7ff9011110000004    validate_get_manual_recover_enable=1




*** Keywords ***
Get first data from logs page
    Go To Logs Page
    ${data}       Get Table Cell    ${LOGS_TABLE}    1    10
    ${status}    Validate Command    ${data}    GET_METER_GAS_VALVE_STATE    state=1
    Log To Console    ${status}
