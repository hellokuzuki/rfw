*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot


*** Variables ***
${get_cmd}        GET_NIC_MODE
${set_cmd}        SET_NIC_MODE

${para_1}         mode_id=3,MAC_polling_interval=303,spread_factor=3,poll_confirmation=1
${mode_1}         mode_id=3

${para_2}         mode_id=4,MAC_polling_interval=304,spread_factor=2,poll_confirmation=0
${mode_2}         mode_id=4

${para_3}         mode_id=5,MAC_polling_interval=305,spread_factor=1,poll_confirmation=1
${mode_3}         mode_id=5

*** Test Cases ***
Validate Command SET_NIC_MODE Set To Para1
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${para_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${mode_1}    ${para_1}    ${eid}

Validate Command SET_NIC_MODE Set To Para2
    Send Command And Validate Response    ${set_cmd}    ${para_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${mode_2}    ${para_2}    ${eid}

Validate Command SET_NIC_MODE Set To Para3
    Send Command And Validate Response    ${set_cmd}    ${para_3}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${mode_3}    ${para_3}    ${eid}
