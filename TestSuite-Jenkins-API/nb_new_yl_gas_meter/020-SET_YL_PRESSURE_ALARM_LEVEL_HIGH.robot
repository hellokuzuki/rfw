*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${pressure_alarm_level_high}        SET_YL_PRESSURE_ALARM_LEVEL_HIGH
${preesure_high_para1}              high_Pressure_action=1,high_pressure=100

*** Test Cases ***
Validate Command SET_YL_PRESSURE_ALARM_LEVEL_HIGH
    User Login By SessionID
    Send Command And Validate Response    ${pressure_alarm_level_high}    ${preesure_high_para1}    ${EMPTY}    ${eid}
