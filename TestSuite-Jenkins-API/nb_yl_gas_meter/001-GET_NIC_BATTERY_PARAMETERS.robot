*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_nb_api_keywords.robot
Resource    ../../Resources/regression_nb_api_setting.robot

*** Variables ***
${get_cmd}        GET_NIC_BATTERY_PARAMETERS
${set_cmd}        SET_NIC_BATTERY_PARAMETERS
${para1}          initial_capacity_mAh=2,remaining_capacity_mAh=1,derating_percentage=0,correction_factor=0.1
${para2}          initial_capacity_mAh=65535,remaining_capacity_mAh=65534,derating_percentage=99,correction_factor=100.0
${para3}          initial_capacity_mAh=8500,remaining_capacity_mAh=6800,derating_percentage=20,correction_factor=1

*** Test Cases ***
Validate Command SET_NIC_BATTERY_PARAMETERS With para1
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${para1}    ${EMPTY}    ${eid}
    # Sleep    5m
    Send Command And Validate Response    ${get_cmd}    ${para1}    ${para1}    ${eid}

# Validate Command SET_NIC_BATTERY_PARAMETERS With para2
#     Send Command And Validate Response    ${set_cmd}    ${para2}    ${EMPTY}    ${eid}
#     # Sleep    5m
#     Send Command And Validate Response    ${get_cmd}    ${para2}    ${para2}    ${eid}

# Validate Command SET_NIC_BATTERY_PARAMETERS With para3
#     Send Command And Validate Response    ${set_cmd}    ${para3}    ${EMPTY}    ${eid}
#     # Sleep    5m
#     Send Command And Validate Response    ${get_cmd}    ${para3}    ${para3}    ${eid}
