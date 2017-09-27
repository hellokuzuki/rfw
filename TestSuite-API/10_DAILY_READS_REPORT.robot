*** Settings ***
Library     APILibrary    TestData.xlsx    TEST LAB SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Demo
    Login And Check SessionID XLS
    Report Daily Reading
    Send Command To Online Devices    GET_SUMMATION_REPORT_INTERVAL
