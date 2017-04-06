*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_OFLOW_DETECT_RATE
${set_cmd}        SET_OFLOW_DETECT_RATE
${rate_min}       overflow_detect_duration=13
${rate_max}       overflow_detect_duration=40

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_RATE Set to Min
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${rate_min}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${rate_min}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${rate_min}

Validate Command SET_OFLOW_DETECT_RATE Set To Max
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${rate_max}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${rate_max}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${rate_max}
