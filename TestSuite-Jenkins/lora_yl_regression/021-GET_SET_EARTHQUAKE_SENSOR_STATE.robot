*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     ../../Resources/validationLib.py

*** Variables ***
${get_cmd}        GET_EARTHQUAKE_SENSOR_STATE
${set_cmd}        SET_EARTHQUAKE_SENSOR_STATE
${disable}        earthquake_sensor_state=0
${enable}         earthquake_sensor_state=1

*** Test Cases ***
Validate Command SET_EARTHQUAKE_SENSOR_STATE Set to Disable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_EARTHQUAKE_SENSOR_STATE Set To Enable
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}