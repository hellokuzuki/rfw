*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_PRESSURE_ALARM_LEVEL_HIGH
${set_cmd}        SET_PRESSURE_ALARM_LEVEL_HIGH
${level_min}      pressure_alarm_level_high=0
${level_max}      pressure_alarm_level_high=5

*** Test Cases ***
Validate Command SET_PRESSURE_ALARM_LEVEL_HIGH Set to Min
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${level_min}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${level_min}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${level_min}

Validate Command SET_PRESSURE_ALARM_LEVEL_HIGH Set To Max
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${level_max}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${level_max}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${level_max}
