*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${COMMAND_INTERVAL}    5s
${COMMAND_INTERVAL_LONG}    15m

${EID}                 7ff9011020000086

${FMS_URL}             http:/mwlora-admin.test.freestyleiot.com


*** Test Cases ***
Validate GET_METER_TYPE Command
    Select GateWay    ${TEST_GATEWAY}
    # Have to manually sort and resize the end devices col. so put 30 secs.
    Sleep    30s

Validate GET_METER_SUMMATION_DELIVERED Command
    Send Get Command To Single Device    GET_METER_TYPE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_SUMMATION_DELIVERED
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_CURRENT_PRESSURE
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_SUMMATION_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Get Command To Single Device    GET_METER_BATTERY_LIFE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_STATUS
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Get Command To Single Device    GET_METER_CUSTOMERID
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_TIME
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PROTOCOL_VERSION
    Sleep    ${COMMAND_INTERVAL_LONG}

Validate GET_METER_CURRENT_PRESSURE Command
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_SUMMATION_REPORT_INTERVAL    summation_schedule=360
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_REPORT_INTERVAL    pressure_schedule=360
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Set Command To Single Device    SET_METER_BATTERY_LIFE    battery_milliamp_hours_remaining=2000
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_READING_VALUE    reading_value=188888
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_STATUS    location=0,value=1
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_CUSTOMER_ID    customer_id=01600000010272
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Set Command To Single Device    SET_METER_TIME    time=1479503822
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_CONFIG_CENTER_SHUTDOWN    ${EMPTY}
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_CONFIG_DISABLE_CENTER_SHUTDOWN    ${EMPTY}
    Sleep    ${COMMAND_INTERVAL_LONG}

Validate GET_METER_GAS_VALVE_STATE Command
    Send Get Command To Single Device    GET_METER_TYPE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_SUMMATION_DELIVERED
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_CURRENT_PRESSURE
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_SUMMATION_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Get Command To Single Device    GET_METER_BATTERY_LIFE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_STATUS
    Sleep    ${COMMAND_INTERVAL_LONG}
    Send Get Command To Single Device    GET_METER_CUSTOMERID
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_TIME
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PROTOCOL_VERSION
    Sleep    ${COMMAND_INTERVAL_LONG}

