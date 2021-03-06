*** Settings ***
Library     APILibrary    TestData.xlsx    TEST LAB SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
SET_SUMMATION_INTERVAL
    Login And Check SessionID XLS
    &{EID_CID}   Device Send Command    SET_SUMMATION_REPORT_INTERVAL    report_interval_mins=1440
    Validate Init Command    SET_SUMMATION_REPORT_INTERVAL    &{EID_CID}