*** Settings ***
Resource    ../Resources/variables.robot
Resource    ../Resources/keywords.robot

*** Test Cases ***
Demo1
    FMS Login
    : FOR    ${INDEX}    IN RANGE    1    10
    \    Send Get Command To Group Devices    GET_METER_SUMMATION_DELIVERED
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_METER_CURRENT_PRESSURE
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_METER_GAS_VALVE_STATE
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_YL_OFLOW_DETECT_ENABLE
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_YL_OFLOW_DETECT_DURATION
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_YL_OFLOW_DETECT_RATE
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_YL_PRESSURE_ALARM_LEVEL_LOW
    \    Sleep    15m
    \    Send Get Command To Group Devices    GET_YL_PRESSURE_ALARM_LEVEL_HIGH
    \    Sleep    15m
    Close Browser




