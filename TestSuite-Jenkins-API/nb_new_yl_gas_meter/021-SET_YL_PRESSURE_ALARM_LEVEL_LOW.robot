*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${pressure_alarm_level_low}         SET_YL_PRESSURE_ALARM_LEVEL_LOW
${preesure_low_para1}               low_pressure_action=1,low_pressure_min=0,low_pressure_max=0

*** Test Cases ***
Validate Command SET_YL_PRESSURE_ALARM_LEVEL_LOW
    User Login By SessionID
    Send Command And Validate Response    ${pressure_alarm_level_low}    ${preesure_low_para1}    ${EMPTY}    ${eid}
