*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_PRESSURE_ALARM_LEVEL_LOW
${set_cmd}        SET_PRESSURE_ALARM_LEVEL_LOW
${level_min}      pressure_alarm_level_low=0
${level_max}      pressure_alarm_level_low=5

*** Test Cases ***
Validate Command SET_PRESSURE_ALARM_LEVEL_LOW Set to Min
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${level_min}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${level_min}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${level_min}

Validate Command SET_PRESSURE_ALARM_LEVEL_LOW Set To Max
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${level_max}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${level_max}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${level_max}
