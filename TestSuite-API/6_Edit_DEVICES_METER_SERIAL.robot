*** Settings ***
Library     APILibrary    TestData.xlsx    TEST LAB SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***
# ${devices}        YL EID
*** Test Cases ***
Edit_DEVICES_METER_SERIAL
    Login And Check SessionID XLS
    Edit Meter Serial Number To FMS
