*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${cmd}        GET_ELECTRIC_QNT_VALUE

*** Test Cases ***
Validate Command GET_ELECTRIC_QNT_VALUE
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${cmd}
    Wait And Validate Response Of Command    ${eid}    ${cmd}
