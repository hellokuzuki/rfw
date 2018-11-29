*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot


*** Variables ***
${get_cmd}        GET_NIC_SCHEDULE
${set_cmd}        SET_NIC_SCHEDULE
${para_1}         day_mask=8,active_period_start_time=34,active_period_end_time=75,active_period_mode=3,inactive_period_mode=4,time_offset=-48
${para_2}         day_mask=127,active_period_start_time=0,active_period_end_time=96,active_period_mode=4,inactive_period_mode=5,time_offset=48

*** Test Cases ***
Validate Command SET_NIC_SCHEDULE Set To Para1
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${para_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${para_1}    ${eid}

Validate Command SET_NIC_SCHEDULE Set To Para2
    Send Command And Validate Response    ${set_cmd}    ${para_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${para_2}    ${eid}