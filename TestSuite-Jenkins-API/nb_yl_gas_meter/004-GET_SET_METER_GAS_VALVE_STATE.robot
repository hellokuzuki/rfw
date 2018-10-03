*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_METER_GAS_VALVE_STATE
${set_cmd}        SET_METER_GAS_VALVE_STATE
${open_valve}     valve_state=1
${close_valve}    valve_state=0

*** Test Cases ***
Validate Command SET_METER_GAS_VALVE_STATE With Open state
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${open_valve}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${open_valve}    ${open_valve}    ${eid}

Validate Command SET_METER_GAS_VALVE_STATE With Close state
    Send Command And Validate Response    ${set_cmd}    ${close_valve}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${close_valve}    ${close_valve}    ${eid}