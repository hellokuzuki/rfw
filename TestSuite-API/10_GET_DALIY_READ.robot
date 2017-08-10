*** Settings ***
Library     APILibrary    TestData.xlsx    TEST LAB SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
GET DAILY READ
    Login And Check SessionID XLS
    @{total_online_devices}    ${totoal_online_number}    Get All Online Devices
    Log To Console    ${totoal_online_number}
    ${Yesterday}    Get Yesterday Date
    Log To Console    ${Yesterday}