*** Settings ***
Resource    ../../Resources/poet_variables.robot
Library     Selenium2Library    implicit_wait=3

*** Variables ***


*** Test Cases ***
Validate Title Of Login Page
    Open Browser    ${POET_URL}    ${CHROME}
    Set Window Size    1920    1080
    Title Should Be    ${TITLE}
    Close Browser
