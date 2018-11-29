*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_nb_api_keywords.robot
Resource    ../../Resources/regression_nb_api_setting.robot

*** Variables ***
${cmd}    GET_NIC_BATTERY_LEVEL

*** Test Cases ***
Validate commnad GET_NIC_BATTERY_LEVEL
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}
