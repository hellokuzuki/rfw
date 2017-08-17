*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Login Successful
    [Documentation]    The Poet login page is displayed
    Input Text    ${INPUT_USERNAME}    ${USERNAME}
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    Click Button   ${BTN_SIGNIN}


    #1. Dashboard default page validateion need to be adeded.
    #2. Log record created with username, date & time need to be added.
    Log To Console    Not Yet Completed.
    Fail
