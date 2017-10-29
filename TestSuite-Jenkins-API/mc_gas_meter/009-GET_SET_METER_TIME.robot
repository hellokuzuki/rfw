*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${get_cmd}        GET_METER_TIME
${set_cmd}        SET_METER_TIME
${time_1}         time=1491370600
${time_2}         time=1491370787

*** Test Cases ***
Validate Command SET_METER_TIME Set To Time 1
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${time_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${time_1}    ${eid}

Validate Command SET_METER_TIME Set To Time 2
    Send Command And Validate Response    ${set_cmd}    ${time_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${time_2}    ${eid}
