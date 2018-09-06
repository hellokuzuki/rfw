*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot


*** Variables ***
${cmd}        SET_CONFIG_DISABLE_CENTER_SHUTDOWN

*** Test Cases ***
Validate Command SET_CONFIG_DISABLE_CENTER_SHUTDOWN
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}