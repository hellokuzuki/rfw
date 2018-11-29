*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${cmd}        GET_YL_LAST_5_STATUS_LOG

*** Test Cases ***
Validate Command GET_YL_LAST_5_STATUS_LOG
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}
    # Sleep    5m
