*** Settings ***
Library     APILibrary
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Add Nodes To Application Server
    Add Nodes To AS    @{AS_DEV_EUIs}
