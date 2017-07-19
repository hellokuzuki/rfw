*** Settings ***
Library     APILibrary    TestData.xlsx    MARK SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Delete Nodes To Application Server
    Delete Nodes From AS