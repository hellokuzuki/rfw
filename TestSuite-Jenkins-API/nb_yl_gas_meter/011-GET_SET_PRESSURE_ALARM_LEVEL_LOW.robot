*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_PRESSURE_ALARM_LEVEL_LOW
${set_cmd}        SET_PRESSURE_ALARM_LEVEL_LOW
${level_min}      pressure_alarm_level_low=0
${level_max}      pressure_alarm_level_low=5

*** Test Cases ***
Validate Command SET_PRESSURE_ALARM_LEVEL_LOW Set to Min
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${level_min}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${level_min}    ${eid}

Validate Command SET_PRESSURE_ALARM_LEVEL_LOW Set To Max
    Send Command And Validate Response    ${set_cmd}    ${level_max}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${level_max}    ${eid}