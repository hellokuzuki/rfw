*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${COMMAND_INTERVAL}    10m

${EID}                 7ff9011110000004

${FMS_URL}             http:/mwlora-admin.test.freestyleiot.com


*** Test Cases ***
Validate GET_METER_TYPE Command
    Select GateWay    ${TEST_GATEWAY}
    Sleep    5s

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
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    valve_state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    valve_state=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_METER_GAS_VALVE_STATE    valve_state=2
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_METER_GAS_VALVE_STATE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_SUMMATION_REPORT_INTERVAL Command
#Range >=5
    Send Get Command To Single Device    GET_SUMMATION_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=4
    Sleep    ${COMMAND_INTERVAL}
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

Validate GET_PRESSURE_REPORT_INTERVAL Command
    Send Get Command To Single Device    GET_PRESSURE_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_REPORT_INTERVAL    report_interval_mins=4
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_REPORT_INTERVAL    report_interval_mins=8
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_REPORT_INTERVAL    report_interval_mins=1440
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_REPORT_INTERVAL
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_VERSION Command
    Send Get Command To Single Device    GET_METER_VERSION
    Sleep    ${COMMAND_INTERVAL}

Validate GET_OFLOW_DETECT_ENABLE Command
    Send Get Command To Single Device    GET_OFLOW_DETECT_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_ENABLE    overflow_detect_enable=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_ENABLE    overflow_detect_enable=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_ENABLE    overflow_detect_enable=2
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_ENABLE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_OFLOW_DETECT_DURATION Command
#Range 5-999
    Send Get Command To Single Device    GET_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=4
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=5
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=999
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=1000
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=50
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_DURATION
    Sleep    ${COMMAND_INTERVAL}

Validate GET_OFLOW_DETECT_RATE Command
#Range 13-40
    Send Get Command To Single Device    GET_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=12
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=14
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=40
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=41
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=15
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_OFLOW_DETECT_RATE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_PRESSURE_ALARM_LEVEL_LOW Command
#Range 0-5
    Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_LOW
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_low=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_LOW
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_low=5
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_LOW
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_low=6
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_LOW
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_PRESSURE_ALARM_LEVEL_HIGH Command
#Range 0-5
    Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_HIGH
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_ALARM_LEVEL_HIGH    pressure_alarm_level_high=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_HIGH
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PRESSURE_ALARM_LEVEL_HIGH    pressure_alarm_level_high=5
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_HIGH
    Sleep    ${COMMAND_INTERVAL}
    # Send Set Command To Single Device    SET_PRESSURE_ALARM_LEVEL_HIGH    pressure_alarm_level_high=6
    # Sleep    ${COMMAND_INTERVAL}
    # Send Get Command To Single Device    GET_PRESSURE_ALARM_LEVEL_HIGH
    # Sleep    ${COMMAND_INTERVAL}

Validate GET_LEAK_DETECT_RANGE Command
#Range 0-9
    Send Get Command To Single Device    GET_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_LEAK_DETECT_RANGE    leak_detect_range=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_LEAK_DETECT_RANGE    leak_detect_range=9
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_LEAK_DETECT_RANGE    leak_detect_range=10
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_LEAK_DETECT_RANGE    leak_detect_range=5
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_LEAK_DETECT_RANGE
    Sleep    ${COMMAND_INTERVAL}


Validate GET_MANUAL_RECOVER_ENABLE Command
    Send Get Command To Single Device    GET_MANUAL_RECOVER_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MANUAL_RECOVER_ENABLE    manual_recover_enable=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MANUAL_RECOVER_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MANUAL_RECOVER_ENABLE    manual_recover_enable=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MANUAL_RECOVER_ENABLE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_MANUAL_RECOVER_ENABLE    manual_recover_enable=2
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_MANUAL_RECOVER_ENABLE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_FIRMWARE_VERSION Command
    Send Get Command To Single Device    GET_METER_FIRMWARE_VERSION
    Sleep    ${COMMAND_INTERVAL}

Validate GET_METER_SHUTOFF_CODES Command
    Send Get Command To Single Device    GET_METER_SHUTOFF_CODES
    Sleep    ${COMMAND_INTERVAL}

# Validate GET_METER_SERIAL_NUMBER Command
#     Send Get Command To Single Device    GET_METER_SERIAL_NUMBER
#     Sleep    ${COMMAND_INTERVAL}
#     Send Set Command To Single Device    SET_METER_SERIAL_NUMBER    meter_serial_number=helloworld
#     Sleep    ${COMMAND_INTERVAL}
#     Send Get Command To Single Device    GET_METER_SERIAL_NUMBER
#     Sleep    ${COMMAND_INTERVAL}

Validate GET_ELECTRIC_QNT_VALUE Command
    Send Get Command To Single Device    GET_ELECTRIC_QNT_VALUE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_COMMS_MODE Command
    Send Get Command To Single Device    GET_COMMS_MODE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_COMMS_MODE    meter_comms_mode=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_COMMS_MODE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_COMMS_MODE    meter_comms_mode=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_COMMS_MODE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_COMMS_MODE    meter_comms_mode=2
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_COMMS_MODE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_PILOT_LIGHT_MODE Command
    Send Get Command To Single Device    GET_PILOT_LIGHT_MODE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PILOT_LIGHT_MODE     pilot_light_mode=1,pilot_flow_min=10,pilot_flow_max=20
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PILOT_LIGHT_MODE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PILOT_LIGHT_MODE     pilot_light_mode=0,pilot_flow_min=10,pilot_flow_max=55
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PILOT_LIGHT_MODE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_PILOT_LIGHT_MODE     pilot_light_mode=5,pilot_flow_min=500,pilot_flow_max=550
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_PILOT_LIGHT_MODE
    Sleep    ${COMMAND_INTERVAL}

Validate GET_EARTHQUAKE_SENSOR_STATE Command
    Send Get Command To Single Device    GET_EARTHQUAKE_SENSOR_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_EARTHQUAKE_SENSOR_STATE     earthquake_sensor_state=1
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_EARTHQUAKE_SENSOR_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_EARTHQUAKE_SENSOR_STATE     earthquake_sensor_state=0
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_EARTHQUAKE_SENSOR_STATE
    Sleep    ${COMMAND_INTERVAL}
    Send Set Command To Single Device    SET_EARTHQUAKE_SENSOR_STATE     earthquake_sensor_state=2
    Sleep    ${COMMAND_INTERVAL}
    Send Get Command To Single Device    GET_EARTHQUAKE_SENSOR_STATE
    Sleep    ${COMMAND_INTERVAL}

Collect logs
    Collect Data from CSV    ${EID}    260