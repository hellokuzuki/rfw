*** Settings ***
Resource    ../../Resources/poet_variables.robot
Library     Selenium2Library    implicit_wait=3

*** Variables ***


*** Test Cases ***
Validate Remember Me Checkbox of Login Page
    Open Browser    ${POET_URL}    ${CHROME}
    Set Window Size    1920    1080
    Page Should Contain Checkbox    ${CHECK_REME}
    Checkbox Should Not Be Selected    ${CHECK_REME}
    Select Checkbox    ${CHECK_REME}
    Checkbox Should Be Selected    ${CHECK_REME}
    Unselect Checkbox    ${CHECK_REME}
    Checkbox Should Not Be Selected    ${CHECK_REME}
    Close Browser