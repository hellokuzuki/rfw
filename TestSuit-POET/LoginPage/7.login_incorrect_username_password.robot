*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Alert Message of Incorrect Username And Password
    [Documentation]    "Invalid username and password" text is displayed in text box
    Input Text    ${INPUT_USERNAME}    ${INVALID_ID}
    Input Text    ${INPUT_PASSWORD}    ${INVALID_PW}
    Click Button   ${BTN_SIGNIN}
    Wait Until Element Is Visible    ${ALERT_FIELD}
    Element Text Should Be    ${ALERT_FIELD}    ${ALERT_INVALID_CREDENTIAL}