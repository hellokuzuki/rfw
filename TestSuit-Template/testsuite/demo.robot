*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     ../../Resources/validationLib.py
*** Variables ***
@{test}      7ff9011110000004    7ff9011110000009     7ff9010926000001

*** Test Cases ***
# Demo
#     Select GateWay      990200000000269b
#     Send Out Command To Multiple EIDs    GET_METER_SUMMATION_DELIVERED    ${EMPTY}    7ff9011110000004
#     Go To Logs Page
#     Fail    Test Fail set up
#     Wait And Validate Response Of Command    GET_METER_SUMMATION_DELIVERED    7ff9011110000004

Demo1
    Select GateWay      990200000000269b
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

    Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_high=3    7ff9011110000004
    Wait And Validate Response Of Command    SET_PRESSURE_ALARM_LEVEL_LOW    7ff9011110000004
    Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_LOW    ${EMPTY}    7ff9011110000004
    Wait And Validate Response Of Command    GET_PRESSURE_ALARM_LEVEL_LOW    7ff9011110000004    pressure_alarm_level_high=3


*** Keywords ***
Get first data from logs page
    Go To Logs Page
    ${data}       Get Table Cell    ${LOGS_TABLE}    1    10
    ${status}    Validate Command    ${data}    GET_METER_GAS_VALVE_STATE    state=1
    Log To Console    ${status}
