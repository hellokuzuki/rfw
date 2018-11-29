*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${set_cmd}          SET_YL_METER_DATE_TIME
${taiwan_time}      time_difference=28800
${victoria_time}    time_difference=39600

*** Test Cases ***
Validate Command SET_YL_METER_DATE_TIME Set To taiwan_time
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${taiwan_time}    ${EMPTY}    ${eid}

Validate Command SET_YL_METER_DATE_TIME Set To victoria_time
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${victoria_time}    ${EMPTY}    ${eid}
