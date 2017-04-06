*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_LEAK_DETECT_RANGE
${set_cmd}        SET_LEAK_DETECT_RANGE
${range_min}      leak_detect_range=0
${range_max}      leak_detect_range=9

*** Test Cases ***
Validate Command SET_LEAK_DETECT_RANGE Set to Min
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${range_min}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${range_min}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${range_min}

Validate Command SET_LEAK_DETECT_RANGE Set To Max
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${range_max}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${range_max}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${range_max}
