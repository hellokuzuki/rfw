*** Settings ***
Library     APILibrary    TestData.xlsx    TEST LAB SERVER
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Demo
    Login And Check SessionID XLS
    Report Daily Reading
    # get_unsocilited_response    GET_METER_SUMMATION_DELIVERED
    # get_requested_response    SET_SUMMATION_REPORT_INTERVAL
    # send_command_to_online_devices    GET_SUMMATION_REPORT_INTERVAL