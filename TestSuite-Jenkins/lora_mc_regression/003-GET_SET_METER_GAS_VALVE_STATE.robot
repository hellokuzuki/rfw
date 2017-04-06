*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_METER_GAS_VALVE_STATE
${set_cmd}        SET_METER_GAS_VALVE_STATE
${open_valve}     valve_state=1
${close_valve}    valve_state=0

*** Test Cases ***
Validate Command SET_METER_GAS_VALVE_STATE With Open state
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${open_valve}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${open_valve}

Validate Command SET_METER_GAS_VALVE_STATE With Close state
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${close_valve}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${close_valve}