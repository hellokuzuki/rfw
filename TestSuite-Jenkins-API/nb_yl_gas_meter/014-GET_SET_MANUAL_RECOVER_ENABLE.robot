*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_MANUAL_RECOVER_ENABLE
${set_cmd}        SET_MANUAL_RECOVER_ENABLE
${disable}        manual_recover_enable=0
${enable}         manual_recover_enable=1

*** Test Cases ***
Validate Command SET_MANUAL_RECOVER_ENABLE Set to Disable
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${disable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${disable}    ${eid}

Validate Command SET_MANUAL_RECOVER_ENABLE Set To Enable
    Send Command And Validate Response    ${set_cmd}    ${enable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${enable}    ${eid}