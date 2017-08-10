*** Settings ***
Library     APILibrary    TestData.xlsx    MARK SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
# ${devices}        YL EID

*** Test Cases ***
UPDATE_APP_FROM_FMS
    Login And Check SessionID XLS
    Delete APP And Install New App    #${devices}