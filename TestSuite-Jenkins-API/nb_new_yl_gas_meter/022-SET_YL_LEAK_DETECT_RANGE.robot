*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${leak_detect_range}                SET_YL_LEAK_DETECT_RANGE
${leak_range_para1}                 leak_action=1,leak_shutoff_day=3,leak_range_min=0,leak_range_max=1

*** Test Cases ***
Validate Command SET_YL_LEAK_DETECT_RANGE
    User Login By SessionID
    Send Command And Validate Response    ${leak_detect_range}    ${leak_range_para1}    ${EMPTY}    ${eid}
