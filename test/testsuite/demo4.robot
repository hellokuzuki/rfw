*** Settings ***
Library    Selenium2Library

*** Variables ***
${var}    inside test!!!!!!!!!!!!
*** Test Cases ***
Demo
    Open Browser    http://www.google.com.au    firefox
    Log To Console    ${var}
    Sleep    5s
    Close Browser
