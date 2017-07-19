*** Settings ***
Library     APILibrary    TestData.xlsx    MARK SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
${devices}        YL EID

*** Test Cases ***
Send Init Command To Devices
    Login And Check SessionID XLS
    &{EID_CID}   Device Send Init Command    ${test_server}    ${devices}    GET_METER_SUMMATION_DELIVERED
    Validate Init Command    ${test_server}    GET_METER_SUMMATION_DELIVERED    &{EID_CID}