*** Settings ***
Library     APILibrary    test.xlsx
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
${test_server}    TEST LAB SERVER
${devices}        YL EID

*** Test Cases ***
Delete Devices From FMS
    Login And Check SessionID XLS    ${test_server}
    Delete APP And Remove Devices FROM FMS    ${test_server}    ${devices}