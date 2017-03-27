*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     ../../Resources/validationLib.py
*** Variables ***
@{test}      7ff9011202000004    7ff9011202000005    7ff9011202000006    7ff9011202000007    7ff9011202000012
...          7ff9011202000013    7ff9011202000014    7ff9011202000015    7ff9011202000016    7ff9011202000017

*** Test Cases ***
# Demo
#     Select GateWay      990200000000269b
#     Send Out Command To Multiple EIDs    GET_METER_SUMMATION_DELIVERED    ${EMPTY}    7ff9011110000004
#     Go To Logs Page
#     Fail    Test Fail set up
#     Wait And Validate Response Of Command    GET_METER_SUMMATION_DELIVERED    7ff9011110000004

Demo1
    Select GateWay     990200000000269f
    : For    ${index}    In Range    1    10000
    \     Send Out Command To Multiple EIDs    GET_SUMMATION_REPORT_INTERVAL    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=1440    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_SUMMATION_REPORT_INTERVAL    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_PRESSURE_REPORT_INTERVAL    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_PRESSURE_REPORT_INTERVAL    report_interval_mins=1440    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PRESSURE_REPORT_INTERVAL    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_METER_TYPE    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_METER_SUMMATION_DELIVERED    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_METER_CURRENT_PRESSURE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_METER_GAS_VALVE_STATE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_METER_GAS_VALVE_STATE    valve_state=1    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_METER_GAS_VALVE_STATE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_METER_GAS_VALVE_STATE    valve_state=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_METER_GAS_VALVE_STATE    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_METER_VERSION    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_ENABLE    ${EMPTY}    @{test}
    # \     Sleep 10m

    \     Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_ENABLE    overflow_detect_enable=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_ENABLE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_ENABLE    overflow_detect_enable=1    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_ENABLE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_DURATION    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=5    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_DURATION    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_DURATION    overflow_detect_duration=999    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_DURATION    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_RATE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=13    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_RATE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_OFLOW_DETECT_RATE    overflow_detect_flowrate=40    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_OFLOW_DETECT_RATE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_LOW    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_low=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_LOW    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_LOW    pressure_alarm_level_low=5    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_LOW    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_HIGH    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_HIGH    pressure_alarm_level_high=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_HIGH    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_PRESSURE_ALARM_LEVEL_HIGH    pressure_alarm_level_high=5    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PRESSURE_ALARM_LEVEL_HIGH    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_LEAK_DETECT_RANGE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_LEAK_DETECT_RANGE    leak_detect_range=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_LEAK_DETECT_RANGE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_LEAK_DETECT_RANGE    leak_detect_range=9    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_LEAK_DETECT_RANGE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_MANUAL_RECOVER_ENABLE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_MANUAL_RECOVER_ENABLE    manual_recover_enable=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_MANUAL_RECOVER_ENABLE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_MANUAL_RECOVER_ENABLE    manual_recover_enable=1    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_MANUAL_RECOVER_ENABLE    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_METER_FIRMWARE_VERSION    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_METER_SHUTOFF_CODES    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_METER_SERIAL_NUMBER    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_METER_SERIAL_NUMBER    meter_serial_number=qqqqq11111    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_METER_SERIAL_NUMBER    ${EMPTY}    @{test}
    \     Sleep     10m

    \     Send Out Command To Multiple EIDs    GET_ELECTRIC_QNT_VALUE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_COMMS_MODE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_COMMS_MODE    meter_comms_mode=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_COMMS_MODE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_COMMS_MODE    meter_comms_mode=1    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_COMMS_MODE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_PILOT_LIGHT_MODE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_PILOT_LIGHT_MODE    pilot_light_mode=0,pilot_flow_min=9,pilot_flow_max=50    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PILOT_LIGHT_MODE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_EARTHQUAKE_SENSOR_STATE    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_EARTHQUAKE_SENSOR_STATE    meter_comms_mode=0    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_EARTHQUAKE_SENSOR_STATE    ${EMPTY}    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    SET_EARTHQUAKE_SENSOR_STATE    meter_comms_mode=1    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_EARTHQUAKE_SENSOR_STATE    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_SUMMATION_REPORT_INTERVAL    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=30    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_SUMMATION_REPORT_INTERVAL    ${EMPTY}    @{test}
    \     Sleep     10m
    # \     Send Out Command To Multiple EIDs    GET_PRESSURE_REPORT_INTERVAL    ${EMPTY}    @{test}
    # \     Sleep 10m
    \     Send Out Command To Multiple EIDs    SET_PRESSURE_REPORT_INTERVAL    report_interval_mins=30    @{test}
    \     Sleep     10m
    \     Send Out Command To Multiple EIDs    GET_PRESSURE_REPORT_INTERVAL    ${EMPTY}    @{test}
    \     Sleep     10m


    # \     Send Out Command To Multiple EIDs    GET_METER_CURRENT_PRESSURE    ${EMPTY}    @{test}
    \     log to console     ${index}
    \     Sleep     2h




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
