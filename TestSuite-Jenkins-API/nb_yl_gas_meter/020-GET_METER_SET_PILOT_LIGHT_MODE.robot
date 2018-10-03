*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot


*** Variables ***
${get_cmd}        GET_METER_PILOT_LIGHT_MODE
${set_cmd}        SET_METER_PILOT_LIGHT_MODE
${para_1}         pilot_light_mode=0,pilot_flow_min=9,pilot_flow_max=50
${Para_2}         pilot_light_mode=1,pilot_flow_min=13,pilot_flow_max=53

*** Test Cases ***
Validate Command SET_PILOT_LIGHT_MODE Set to Disable
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${para_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${para_1}    ${eid}

Validate Command SET_PILOT_LIGHT_MODE Set To Enable
    Send Command And Validate Response    ${set_cmd}    ${Para_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${Para_2}    ${eid}
