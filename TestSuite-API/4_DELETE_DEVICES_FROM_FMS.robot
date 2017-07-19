*** Settings ***
Library     APILibrary    TestData.xlsx    MARK SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
${devices}        YL EID

*** Test Cases ***
Delete Devices From FMS
    Login And Check SessionID XLS
    Delete APP And Remove Devices FROM FMS    ${devices}