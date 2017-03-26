*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     ../../Resources/validationLib.py
*** Variables ***
${cmd}        GET_METER_CURRENT_PRESSURE

*** Test Cases ***
Validate Command GET_METER_CURRENT_PRESSURE
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${cmd}
    Wait And Validate Response Of Command    ${eid}    ${cmd}
