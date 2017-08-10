*** Settings ***
Resource    ../../Resources/poet_variables.robot
Library     Selenium2Library    implicit_wait=3

*** Variables ***


*** Test Cases ***
Validate Remember Me Text Of Login Page
    Open Browser    ${POET_URL}    ${CHROME}
    Set Window Size    1920    1080
    Element Text Should Be    ${LOC_REMEMBERME}    ${TEXT_REMEMBER_ME}
    Close Browser