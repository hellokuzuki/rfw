*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot


*** Variables ***
${get_cmd}       GET_METER_CUSTOMERID
${set_cmd}       SET_METER_CUSTOMERID
${id_1}          customer_id=99112233445678
${id_2}          customer_id=99887766554321

*** Test Cases ***
Validate Command SET_METER_CUSTOMERID Set to ID 1
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${id_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${id_1}    ${eid}

Validate Command SET_METER_CUSTOMERID Set To ID 2
    Send Command And Validate Response    ${set_cmd}    ${id_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${id_2}    ${eid}
