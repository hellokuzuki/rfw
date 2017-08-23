*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Global Nav Bar User Defined Avator
    [Documentation]    The profile identifier is displayed with the defined avatar and a selector symbol
    Fail    This Page was not implemented Yet.