*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     ../../Resources/validationLib.py

*** Variables ***
${get_cmd}        GET_COMMS_MODE
${set_cmd}        SET_COMMS_MODE
${disable}        meter_comms_mode=0
${enable}         meter_comms_mode=1

*** Test Cases ***
Validate Command SET_COMMS_MODE Set to Disable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_COMMS_MODE Set To Enable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}