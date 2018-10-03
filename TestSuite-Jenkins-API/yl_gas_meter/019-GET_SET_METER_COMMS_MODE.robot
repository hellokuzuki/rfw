*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${get_cmd}        GET_METER_COMMS_MODE
${set_cmd}        SET_METER_COMMS_MODE
${disable}        meter_comms_mode=0
${enable}         meter_comms_mode=1

*** Test Cases ***
Validate Command SET_COMMS_MODE Set to Disable
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${disable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${disable}    ${eid}

Validate Command SET_COMMS_MODE Set To Enable
    Send Command And Validate Response    ${set_cmd}    ${enable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${enable}    ${eid}
