*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_NIC_SCHEDULE
${set_cmd}        SET_NIC_SCHEDULE
${para_1}         day_mask=8,active_period_start_time=34,active_period_end_time=75,active_period_mode=3,inactive_period_mode=4,time_offset=-48
${para_2}         day_mask=127,active_period_start_time=0,active_period_end_time=96,active_period_mode=4,inactive_period_mode=5,time_offset=48

*** Test Cases ***
Validate Command SET_NIC_SCHEDULE Set To Para1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${para_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}

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
