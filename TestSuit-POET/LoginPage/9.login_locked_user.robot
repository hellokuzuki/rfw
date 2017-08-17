*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Alert Message of Locked Account
    [Documentation]    "Account locked" text is displayed in text box
    Input Text    ${INPUT_USERNAME}    ${LOCED_ID}
    Input Text    ${INPUT_PASSWORD}    ${LOCED_PW}
    Click Button   ${BTN_SIGNIN}
    Sleep    3s
    Element Text Should Be    ${ALERT_FIELD}    ${ALERT_ACC_LOCKED_2}