*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${get_cmd}        GET_EARTHQUAKE_SENSOR_STATE
${set_cmd}        SET_EARTHQUAKE_SENSOR_STATE
${disable}        earthquake_sensor_state=0
${enable}         earthquake_sensor_state=1

*** Test Cases ***
Validate Command SET_EARTHQUAKE_SENSOR_STATE Set to Disable
    User Login By SessionID
    Send Command And Validate Response    ${set_cmd}    ${disable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${disable}    ${eid}

Validate Command SET_EARTHQUAKE_SENSOR_STATE Set To Enable
    Send Command And Validate Response    ${set_cmd}    ${enable}    ${EMPTY}    ${eid}
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${enable}    ${eid}