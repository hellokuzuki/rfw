*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_NIC_SCHEDULE
${set_cmd}        SET_NIC_SCHEDULE
${para_1}         day_mask=127,active_period_start_time=0,active_period_end_time=95,modes=85
${para_2}         day_mask=0,active_period_start_time=0,active_period_end_time=1,modes=0
${para_3}         day_mask=62,active_period_start_time=36,active_period_end_time=68,modes=69

*** Test Cases ***
Validate Command SET_NIC_SCHEDULE Set To Para1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${para_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${para_1}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_1}

Validate Command SET_NIC_SCHEDULE Set To Para2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${Para_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${para_2}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_2}

Validate Command SET_NIC_SCHEDULE Set To Para3
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${Para_3}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${para_3}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_3}