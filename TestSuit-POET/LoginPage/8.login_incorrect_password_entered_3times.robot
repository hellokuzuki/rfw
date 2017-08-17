*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Alert Message of Account Locked
    [Documentation]    "Account locked" text is displayed in text box
    : For    ${t}    In Range    1    4
    \    Input Text    ${INPUT_USERNAME}    ${TEST_LOCKED_ID}
    \    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    \    Click Button   ${BTN_SIGNIN}
    \    Sleep    3s
    Element Text Should Be    ${ALERT_FIELD}    ${ALERT_ACC_LOCKED_1}