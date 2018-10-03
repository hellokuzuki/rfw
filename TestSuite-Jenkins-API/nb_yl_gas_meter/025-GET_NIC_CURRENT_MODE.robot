*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_NIC_CURRENT_MODE
${para_1}         mode_id=4,MAC_polling_interval=304

*** Test Cases ***
Validate Command GET_NIC_CURRENT_MODE Set To Para1
    User Login By SessionID
    Send Command And Validate Response    ${get_cmd}    ${para_1}    ${para_1}    ${eid}