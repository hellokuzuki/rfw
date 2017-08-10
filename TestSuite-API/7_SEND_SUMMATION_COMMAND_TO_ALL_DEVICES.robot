*** Settings ***
Library     APILibrary    TestData.xlsx    TEST LAB SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
SEND_SUMMATION_COMMAND_TO_ALL_DEVICES
    Login And Check SessionID XLS
    &{EID_CID}   Device Send Init Command    GET_METER_SUMMATION_DELIVERED
    Validate Init Command    GET_METER_SUMMATION_DELIVERED    &{EID_CID}