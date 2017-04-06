*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_OFLOW_DETECT_ENABLE
${set_cmd}        SET_OFLOW_DETECT_ENABLE
${disable}        overflow_detect_enable=0
${enable}         overflow_detect_enable=1

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_ENABLE Disable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}
