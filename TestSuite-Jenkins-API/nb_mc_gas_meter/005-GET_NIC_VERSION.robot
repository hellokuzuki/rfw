*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot


*** Variables ***
${cmd}        GET_NIC_VERSION

*** Test Cases ***
Validate Command GET_NIC_VERSION
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${FW_VER}    ${eid}
