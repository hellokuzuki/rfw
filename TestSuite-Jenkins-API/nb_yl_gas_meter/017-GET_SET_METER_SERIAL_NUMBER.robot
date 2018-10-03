*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}       GET_METER_SERIAL_NUMBER
${set_cmd}       SET_METER_SERIAL_NUMBER
${serial_1}      meter_serial_number=testchar01
${serial_2}      meter_serial_number=testchar99

*** Test Cases ***
Validate Command SET_METER_SERIAL_NUMBER Set to SN 1
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${serial_1}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${serial_1}    ${eid}

Validate Command SET_METER_SERIAL_NUMBER Set To SN 2
    Send Command And Validate Response    ${set_cmd}    ${serial_2}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${serial_2}    ${eid}