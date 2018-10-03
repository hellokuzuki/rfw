*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_OFLOW_DETECT_RATE
${set_cmd}        SET_OFLOW_DETECT_RATE
${rate_min}       overflow_detect_duration=13
${rate_max}       overflow_detect_duration=40

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_RATE Min
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${rate_min}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${rate_min}    ${eid}

Validate Command SET_OFLOW_DETECT_RATE Max
    Send Command And Validate Response    ${set_cmd}    ${rate_max}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${rate_max}    ${eid}