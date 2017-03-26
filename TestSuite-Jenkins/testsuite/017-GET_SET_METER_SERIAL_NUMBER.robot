*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     ../../Resources/validationLib.py

*** Variables ***
${get_cmd}        GET_METER_SERIAL_NUMBER
${set_cmd}        SET_METER_SERIAL_NUMBER
${serial_1}      meter_serial_number=testchar01
${serial_2}      meter_serial_number=testchar99

*** Test Cases ***
Validate Command SET_METER_SERIAL_NUMBER Set to SN 1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${serial_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${serial_1}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${serial_1}

Validate Command SET_METER_SERIAL_NUMBER Set To SN 2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${serial_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${serial_2}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${serial_2}