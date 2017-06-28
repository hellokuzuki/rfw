*** Settings ***
Library     APILibrary
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Delete Nodes To Application Server
    Delete Nodes From AS    @{AS_DEV_EUIs}