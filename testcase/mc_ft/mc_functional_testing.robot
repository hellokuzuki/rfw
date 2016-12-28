*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${COMMAND_INTERVAL}    5m

${EID}                   7ff9011110000009

${FMS_URL}             http:/mwlora-admin.test.freestyleiot.com

*** Test Cases ***
Validate GET_METER_TYPE Command
    Select GateWay    ${TEST_GATEWAY}
    # Have to manually sort and resize the end devices col. so put 30 secs.
    Sleep    5s

    Send Get Command To Single Device    GET_METER_TYPE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_SUMMATION_DELIVERED Command
    Send Get Command To Single Device    GET_METER_SUMMATION_DELIVERED
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_GAS_VALVE_STATE Command
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    valve_state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    valve_state=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_SUMMATION_REPORT_INTERVAL Command
    Send Get Command To Single Device    GET_SUMMATION_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=8
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_SUMMATION_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=1440
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_SUMMATION_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_VERSION Command
    Send Get Command To Single Device    GET_METER_VERSION
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_READING_VALUE Command
    Send Get Command To Single Device    GET_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_READING_VALUE    reading_value=888888
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_READING_VALUE    reading_value=13665
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_STATUS Command
    Send Get Command To Single Device    GET_METER_STATUS
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_CUSTOMERID Command
    Send Get Command To Single Device    GET_METER_CUSTOMERID
    Sleep    ${COMMAND_INTERVAL}
    # # Not working in build 1.0.12-STB
    # Send Set Command To Single Device    SET_METER_CUSTOMERID    customer_id=01234567891234
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_METER_CUSTOMERID
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_TIME Command
    Send Get Command To Single Device    GET_METER_TIME
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_TIME    time=1482459978
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_TIME
    Sleep    ${COMMAND_INTERVAL}

Validate SET_CONFIG_CENTER_SHUTDOWN Command
    Send Get Command To Single Device    SET_CONFIG_CENTER_SHUTDOWN
    Sleep    ${COMMAND_INTERVAL}

Validate SET_CONFIG_DISABLE_CENTER_SHUTDOWN Command
    Send Get Command To Single Device    SET_CONFIG_DISABLE_CENTER_SHUTDOWN
    Sleep    ${COMMAND_INTERVAL}

Validate GET_PROTOCOL_VERSION Command
    Send Get Command To Single Device    GET_PROTOCOL_VERSION
    Sleep    ${COMMAND_INTERVAL}

Collect logs
    Collect Data from CSV    ${EID}    100