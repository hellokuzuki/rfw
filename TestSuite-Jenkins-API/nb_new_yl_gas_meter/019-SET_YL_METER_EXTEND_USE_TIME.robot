*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${extend_use_time}                  SET_YL_METER_EXTEND_USE_TIME
${extend_use_time_para1}            extend_action=2,extend_time=1440

*** Test Cases ***
Validate Command SET_YL_METER_EXTEND_USE_TIME
    User Login By SessionID
    Send Command And Validate Response    ${extend_use_time}    ${extend_use_time_para1}    ${EMPTY}    ${eid}
