*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Alert Message of Missing Username
    [Documentation]    "Username field is empty" text is displayed in dialog box
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    Click Button   ${BTN_SIGNIN}
    ${alert}    Get Alert Message
    Should Be Equal    ${alert}    ${ALERT_NO_USERNAME}

Validate Alert Dismissal
    [Documentation]    Click OK removes dialog box allowing for entry of Username and Password
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    Click Button   ${BTN_SIGNIN}
    Dismiss Alert

