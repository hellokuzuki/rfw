*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_METER_TIME
${set_cmd}        SET_METER_TIME
${time_1}         time=1491370600
${time_2}         time=1491370787

*** Test Cases ***
Validate Command SET_METER_TIME Set To Time 1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${time_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${time_1}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${time_1}

Validate Command SET_METER_TIME Set To Time 2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${time_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${time_2}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${time_2}