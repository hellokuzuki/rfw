*** Settings ***
Library     APILibrary    test.xlsx
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
${test_server}    TEST LAB SERVER
${devices}        YL EID
*** Test Cases ***
Add Devices To FMS
    Login And Check SessionID XLS    ${test_server}
    Add Devices To FMS And Activate Devices     ${test_server}    ${devices}
