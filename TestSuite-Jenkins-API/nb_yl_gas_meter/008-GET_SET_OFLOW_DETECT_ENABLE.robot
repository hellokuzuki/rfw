*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_OFLOW_DETECT_ENABLE
${set_cmd}        SET_OFLOW_DETECT_ENABLE
${disable}        overflow_detect_enable=0
${enable}         overflow_detect_enable=1

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_ENABLE Disable
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${disable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${disable}    ${eid}

Validate Command SET_OFLOW_DETECT_ENABLE Enable
    Send Command And Validate Response    ${set_cmd}    ${enable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${enable}    ${eid}
