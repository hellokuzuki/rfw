*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     ../../Resources/validationLib.py
*** Variables ***
@{test}            7ff9011202000009

*** Test Cases ***
# Demo
#     Select GateWay      990200000000269b
#     Send Out Command To Multiple EIDs    GET_METER_SUMMATION_DELIVERED    ${EMPTY}    7ff9011110000004
#     Go To Logs Page
#     Fail    Test Fail set up
#     Wait And Validate Response Of Command    GET_METER_SUMMATION_DELIVERED    7ff9011110000004

Demo1
    Select GateWay     99020000000026e2
    : For    ${index}    In Range    1    10000

    # \     Send Out Command To Multiple EIDs    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=1440    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_SUMMATION_REPORT_INTERVAL    ${EMPTY}    @{test}
    # \     Sleep     10m


    # \     Send Out Command To Multiple EIDs    GET_METER_TYPE    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    SET_METER_GAS_VALVE_STATE    valve_state=1    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_METER_GAS_VALVE_STATE    ${EMPTY}    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    SET_METER_GAS_VALVE_STATE    valve_state=0    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_METER_GAS_VALVE_STATE    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    GET_METER_VERSION    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    SET_METER_READING_VALUE    reading_value=2046888    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_METER_READING_VALUE    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    GET_METER_STATUS    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    GET_METER_CUSTOMERID    ${EMPTY}    @{test}
    # \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_METER_CUSTOMERID    customer_id=qqqqq111112222    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_METER_CUSTOMERID    ${EMPTY}    @{test}
    \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    GET_METER_TIME    ${EMPTY}    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    SET_METER_TIME    time=1479503822    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_METER_TIME    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    SET_CONFIG_CENTER_SHUTDOWN    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    SET_CONFIG_DISABLE_CENTER_SHUTDOWN    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    GET_PROTOCOL_VERSION    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     Send Out Command To Multiple EIDs    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=30    @{test}
    # \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_SUMMATION_REPORT_INTERVAL    ${EMPTY}    @{test}
    # \     Sleep     10m

    # \     log to console     ${index}
    # \     Sleep     100h




*** Keywords ***
Get first data from logs page
    Go To Logs Page
    ${data}       Get Table Cell    ${LOGS_TABLE}    1    10
    ${status}    Validate Command    ${data}    GET_METER_GAS_VALVE_STATE    state=1
    Log To Console    ${status}
