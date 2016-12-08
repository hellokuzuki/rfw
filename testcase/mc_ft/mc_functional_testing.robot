*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${COMMAND_INTERVAL}    15m

${EID}                 7ff9011110000003

${FMS_URL}             http:/mwlora-admin.test.freestyleiot.com


*** Test Cases ***
Validate GET_METER_TYPE Command
    Select GateWay    ${TEST_GATEWAY}
    # Have to manually sort and resize the end devices col. so put 30 secs.
    Sleep    30s

    Send Get Command To Single Device    GET_METER_TYPE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_SUMMATION_DELIVERED Command
    Send Get Command To Single Device    GET_METER_SUMMATION_DELIVERED
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_CURRENT_PRESSURE Command
    Send Get Command To Single Device    GET_METER_CURRENT_PRESSURE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_GAS_VALVE_STATE Command
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    state=0
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_SUMMATION_SCHEDULE Command
    Send Get Command To Single Device    GET_METER_SUMMATION_SCHEDULE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_SUMMATION_SCHEDULE    pressure_schedule=30
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_SUMMATION_SCHEDULE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_PRESSURE_SCHEDULE Command
    Send Get Command To Single Device    GET_METER_PRESSURE_SCHEDULE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_PRESSURE_SCHEDULE    pressure_schedule=30
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_PRESSURE_SCHEDULE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_MC_METER_READING_VALUE Command
    Send Get Command To Single Device    GET_MC_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MC_METER_READING_VALUE    value=30
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MC_METER_READING_VALUE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_MC_METER_STATUS Command
    Send Get Command To Single Device    GET_MC_METER_STATUS
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MC_METER_STATUS    location=0,value=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MC_METER_STATUS
    Sleep    ${COMMAND_INTERVAL}

Validate GET_MC_METER_CUSTOMER_ID Command
    Send Get Command To Single Device    GET_MC_METER_CUSTOMER_ID
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MC_METER_CUSTOMER_ID    id=01600000010272
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MC_METER_CUSTOMER_ID
    Sleep    ${COMMAND_INTERVAL}

Validate GET_MC_METER_TIME Command
    Send Get Command To Single Device    GET_MC_METER_TIME
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MC_METER_TIME    time=1479503822
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MC_METER_TIME
    Sleep    ${COMMAND_INTERVAL}

Validate SET_MC_CONFIG_CENTER_SHUTDOWN Command
    Send Get Command To Single Device    SET_MC_CONFIG_CENTER_SHUTDOWN
    Sleep    ${COMMAND_INTERVAL}

Validate SET_MC_CONFIG_DISABLE_CENTER_SHUTDOWN Command
    Send Get Command To Single Device    SET_MC_CONFIG_DISABLE_CENTER_SHUTDOWN
    Sleep    ${COMMAND_INTERVAL}