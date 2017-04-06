*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_MANUAL_RECOVER_ENABLE
${set_cmd}        SET_MANUAL_RECOVER_ENABLE
${disable}        manual_recover_enable=0
${enable}         manual_recover_enable=1

*** Test Cases ***
Validate Command SET_MANUAL_RECOVER_ENABLE Set to Disable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_MANUAL_RECOVER_ENABLE Set To Enable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}
