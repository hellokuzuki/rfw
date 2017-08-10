*** Settings ***
Resource    ../../Resources/poet_variables.robot
Library     Selenium2Library    implicit_wait=3

*** Variables ***


*** Test Cases ***
Validate Alert Message of No Username
    Open Browser    ${POET_URL}    ${CHROME}
    Set Window Size    1920    1080
    # Input Text    ${INPUT_USERNAME}    ${USERNAME}
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    Click Button   ${BTN_SIGNIN}
    Alert Should Be Present    ${ALERT_NO_USERNAME}
    Close Browser