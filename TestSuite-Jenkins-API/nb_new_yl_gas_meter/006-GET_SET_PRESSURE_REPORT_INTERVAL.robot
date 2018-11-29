*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_PRESSURE_REPORT_INTERVAL
${set_cmd}        SET_PRESSURE_REPORT_INTERVAL
${inter_min}      report_interval_mins=6
${inter_1day}     report_interval_mins=1440

*** Test Cases ***
Validate Command SET_PRESSURE_REPORT_INTERVAL To 6 mins
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${inter_min}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${inter_min}    ${eid}

Validate Command SET_PRESSURE_REPORT_INTERVAL To 1440 mins
    Send Command And Validate Response    ${set_cmd}    ${inter_1day}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${inter_1day}    ${eid}
