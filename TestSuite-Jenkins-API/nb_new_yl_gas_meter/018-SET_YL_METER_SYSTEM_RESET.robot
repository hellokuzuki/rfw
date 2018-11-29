*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${cmd}        SET_YL_METER_SYSTEM_RESET

*** Test Cases ***
Validate Command SET_YL_METER_SYSTEM_RESET
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}
    # Sleep    5m
