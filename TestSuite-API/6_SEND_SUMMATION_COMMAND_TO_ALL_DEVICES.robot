*** Settings ***
Library     APILibrary    test.xlsx
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
${test_server}    TEST LAB SERVER
${devices}        YL EID

*** Test Cases ***
Send Init Command To Devices
    Login And Check SessionID XLS    ${test_server}
    &{EID_CID}   Device Send Init Command    ${test_server}    ${devices}    GET_METER_SUMMATION_DELIVERED
    Validate Init Command    ${test_server}    GET_METER_SUMMATION_DELIVERED    &{EID_CID}