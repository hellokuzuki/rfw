*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_OFLOW_DETECT_DURATION
${set_cmd}        SET_OFLOW_DETECT_DURATION
${duration_min}   overflow_detect_duration=5
${duration_max}   overflow_detect_duration=999

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_DURATION Set to Min
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${duration_min}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${duration_min}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${duration_min}

Validate Command SET_OFLOW_DETECT_DURATION Set To Max
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${duration_max}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${duration_max}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${duration_max}
