*** Settings ***
Library     Selenium2Library    implicit_wait=3
Resource    poet_variables.robot

*** Keywords ***
Run Test Suite Setup Process
    [Documentation]    Poet Open Browser Process.
    [Arguments]    ${url}=${POET_URL}    ${browser}=${CHROME}
    Open Browser    ${POET_URL}    ${CHROME}
    Set Window Size    ${SCREEN_X}    ${SCREEN_Y}
    Log    *************** Test Suite Setup process completed. ***************


Run Test Suite TearDown Process
    [Documentation]    Poet Close Browser Process.
    Close Browser