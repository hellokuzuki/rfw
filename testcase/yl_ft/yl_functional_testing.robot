*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${COMMAND_INTERVAL}    15m

${EID}                 7ff9011110000004

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

Validate GET_METER_PRESSURE_SCHEDULE Command
    Send Get Command To Single Device    GET_METER_PRESSURE_SCHEDULE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_PRESSURE_SCHEDULE    pressure_schedule=30
    Sleep    ${COMMAND_INTERVAL}

Validate GET_NIC_VERSION Command
    Send Get Command To Single Device    GET_NIC_VERSION
    Sleep    ${COMMAND_INTERVAL}

Validate GET_NIC_BATTERY_LIFE_MAH Command
    Send Get Command To Single Device    GET_NIC_BATTERY_LIFE_MAH
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_NIC_BATTERY_LIFE_MAH    nic_battery_life_mah=100
    Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_OFLOW_DETECT_ENABLE Command
    Send Get Command To Single Device    GET_YL_OFLOW_DETECT_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_OFLOW_DETECT_ENABLE    state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_OFLOW_DETECT_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_ENABLE    state=0
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_OFLOW_DETECT_DURATION Command
    # Send Get Command To Single Device    GET_YL_OFLOW_DETECT_DURATION
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_DURATION    duration=0
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_OFLOW_DETECT_DURATION
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_DURATION    duration=6
    # Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_OFLOW_DETECT_DURATION    duration=100
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_DURATION    duration=999
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_OFLOW_DETECT_DURATION
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_DURATION    duration=1000
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_OFLOW_DETECT_DURATION
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_DURATION    duration=5
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_OFLOW_DETECT_RATE Command
    # Send Get Command To Single Device    GET_YL_OFLOW_DETECT_RATE
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_RATE    rate=10
    # Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_OFLOW_DETECT_RATE    rate=13
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_RATE    rate=40
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_OFLOW_DETECT_RATE
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_OFLOW_DETECT_RATE    rate=41
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_PRESSURE_ALARM_LEVEL_LOW Command
    # Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_LOW
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=0
    # Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_LOW
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_LOW
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=5
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_LOW
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=6
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_PRESSURE_ALARM_LEVEL_HIGH Command
    # Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_HIGH
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=0
    # Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=5
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_PRESSURE_ALARM_LEVEL_HIGH
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=6
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_LEAK_DETECT_RANGE Command
    # Send Get Command To Single Device    GET_YL_LEAK_DETECT_RANGE
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_LEAK_DETECT_RANGE    range=0
    # Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_LEAK_DETECT_RANGE    range=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_LEAK_DETECT_RANGE    range=9
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_YL_LEAK_DETECT_RANGE
    # Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_LEAK_DETECT_RANGE    range=10
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_MANUAL_RECOVER_ENABLE Command
    Send Get Command To Single Device    GET_YL_MANUAL_RECOVER_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_YL_MANUAL_RECOVER_ENABLE    state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_YL_MANUAL_RECOVER_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_YL_MANUAL_RECOVER_ENABLE    state=0
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_FIRMWARE_VERSION Command
    Send Get Command To Single Device    GET_YL_FIRMWARE_VERSION
    Sleep    ${COMMAND_INTERVAL}

Validate GET_YL_METER_SHUTOFFCODES Command
    Send Get Command To Single Device    GET_YL_METER_SHUTOFFCODES
    Sleep    ${COMMAND_INTERVAL}