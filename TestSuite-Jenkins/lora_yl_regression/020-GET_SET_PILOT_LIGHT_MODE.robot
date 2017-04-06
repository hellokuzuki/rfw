*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_PILOT_LIGHT_MODE
${set_cmd}        SET_PILOT_LIGHT_MODE
${para_1}         pilot_light_mode=0,pilot_flow_min=9,pilot_flow_max=50
${Para_2}         pilot_light_mode=1,pilot_flow_min=13,pilot_flow_max=53

*** Test Cases ***
Validate Command SET_PILOT_LIGHT_MODE Set to Disable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${para_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${para_1}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_1}

Validate Command SET_PILOT_LIGHT_MODE Set To Enable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${Para_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${Para_2}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${Para_2}
