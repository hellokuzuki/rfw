*** Settings ***
Resource    ../Resources/variables.robot
Resource    ../Resources/keywords.robot

*** Test Cases ***
Demo1
    FMS Login
    Select GateWay    ${MC_GATEWAY}
    : FOR    ${INDEX}    IN RANGE    1    10
    \    Send Get Command To Group Devices For MC    GET_METER_SUMMATION_DELIVERED
    \    Sleep    15m
    \    Send Get Command To Group Devices For MC    GET_METER_CURRENT_PRESSURE
    \    Sleep    15m
    \    Send Get Command To Group Devices For MC    GET_METER_GAS_VALVE_STATE
    \    Sleep    15m
    \    Send Get Command To Group Devices For MC    GET_MC_METER_READING_VALUE
    \    Sleep    15m
    \    Send Get Command To Group Devices For MC    GET_MC_METER_STATUS
    \    Sleep    15m
    \    Send Get Command To Group Devices For MC    GET_MC_METER_TIME
    \    Sleep    15m
    \    Send Get Command To Group Devices For MC    GET_METER_TYPE
    \    Sleep    15m
    Close Browser