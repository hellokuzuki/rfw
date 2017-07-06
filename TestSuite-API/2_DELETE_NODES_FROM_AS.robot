*** Settings ***
Library     APILibrary    test.xlsx
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Delete Nodes To Application Server
    Delete Nodes From AS