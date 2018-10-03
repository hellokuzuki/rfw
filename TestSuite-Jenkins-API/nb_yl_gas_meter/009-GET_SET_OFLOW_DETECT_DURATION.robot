*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
*** Variables ***
${get_cmd}        GET_OFLOW_DETECT_DURATION
${set_cmd}        SET_OFLOW_DETECT_DURATION
${duration_min}   overflow_detect_duration=5
${duration_max}   overflow_detect_duration=999

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_DURATION Disable
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${duration_min}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${duration_min}    ${eid}

Validate Command SET_OFLOW_DETECT_DURATION Enable
    Send Command And Validate Response    ${set_cmd}    ${duration_max}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${duration_max}    ${eid}