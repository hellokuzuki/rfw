*** Settings ***
Library     APILibrary    TestData.xlsx    MARK SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
${devices}        YL EID
*** Test Cases ***
Add Devices To FMS
    Login And Check SessionID XLS
    Add Devices To FMS And Activate Devices    ${devices}
