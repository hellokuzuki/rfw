*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${get_cmd}        GET_METER_READING_VALUE
${set_cmd}        SET_METER_READING_VALUE
${reading_1}      reading_value=99
${reading_2}      reading_value=9999999

*** Test Cases ***
Validate Command SET_METER_READING_VALUE Set to Min
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${reading_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${reading_1}    ${eid}

Validate Command SET_METER_READING_VALUE Set To Max
    Send Command And Validate Response    ${set_cmd}    ${reading_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${reading_2}    ${eid}