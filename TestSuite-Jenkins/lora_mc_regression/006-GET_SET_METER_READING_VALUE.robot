*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_METER_READING_VALUE
${set_cmd}        SET_METER_READING_VALUE
${reading_1}      reading_value=99
${reading_2}      reading_value=9999999

*** Test Cases ***
Validate Command SET_METER_READING_VALUE Set to Min
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${reading_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${reading_1}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${reading_1}

Validate Command SET_METER_READING_VALUE Set To Max
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${reading_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${reading_2}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${reading_2}