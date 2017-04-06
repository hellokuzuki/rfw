*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}       GET_METER_CUSTOMERID
${set_cmd}       SET_METER_CUSTOMERID
${id_1}          customer_id=00112233445678
${id_2}          customer_id=99887766554321

*** Test Cases ***
Validate Command SET_METER_CUSTOMERID Set to ID 1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${id_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${id_1}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${id_1}

Validate Command SET_METER_CUSTOMERID Set To ID 2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${id_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${id_2}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${id_2}