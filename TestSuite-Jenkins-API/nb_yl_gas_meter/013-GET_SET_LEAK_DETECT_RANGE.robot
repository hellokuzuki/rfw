*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}        GET_LEAK_DETECT_RANGE
${set_cmd}        SET_LEAK_DETECT_RANGE
${range_min}      leak_detect_range=0
${range_max}      leak_detect_range=9

*** Test Cases ***
Validate Command SET_LEAK_DETECT_RANGE Set to Min
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${range_min}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${range_min}    ${eid}

Validate Command SET_LEAK_DETECT_RANGE Set To Max
    Send Command And Validate Response    ${set_cmd}    ${range_max}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${range_max}    ${eid}