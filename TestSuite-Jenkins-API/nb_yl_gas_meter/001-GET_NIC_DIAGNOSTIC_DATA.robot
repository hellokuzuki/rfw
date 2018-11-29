*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_nb_api_keywords.robot
Resource    ../../Resources/regression_nb_api_setting.robot

*** Variables ***
${get_cmd}        GET_NIC_DIAGNOSTIC_DATA
${mode1}          black_id=0

# ${mode2}          black_id=255

*** Test Cases ***
Validate Command GET_NIC_DIAGNOSTIC_DATA Set To mode1
    User Login By SessionID
    Send Command And Validate Response    ${get_cmd}    ${mode1}    ${EMPTY}    ${eid}

# Validate Command GET_NIC_DIAGNOSTIC_DATA Set To mode2
#     Send Command And Validate Response    ${get_cmd}    ${mode2}    ${EMPTY}    ${eid}
