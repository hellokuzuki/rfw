*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
*** Variables ***
${cmd}        GET_METER_SHUTOFF_CODES

*** Test Cases ***
Validate Command GET_METER_SHUTOFF_CODES
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}
