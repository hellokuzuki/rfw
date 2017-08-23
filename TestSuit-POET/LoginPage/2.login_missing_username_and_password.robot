*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
# Current behaviour and will be changed
# Validate Alert Message of No Username and Password
#     [Documentation]    "Please provide a username and password" text is displayed in dialog box
#     Click Button   ${BTN_SIGNIN}
#     ${alert}    Get Alert Message
#     Should Be Equal    ${alert}    ${ALERT_NO_CREDENTIAL}

# Validate Alert Dismissal
#     [Documentation]    Click OK removes dialog box allowing for entry of Username and Password
#     Click Button   ${BTN_SIGNIN}
#     Dismiss Alert

Validate Alert Message of No Username and Password
    [Documentation]    "Please provide a username and password" text is displayed in dialog box
    Click Button   ${BTN_SIGNIN}
    Wait Until Element Is Visible    ${ALERT_FIELD}
    Element Text Should Be    ${ALERT_FIELD}    ${ALERT_NO_CREDENTIAL}