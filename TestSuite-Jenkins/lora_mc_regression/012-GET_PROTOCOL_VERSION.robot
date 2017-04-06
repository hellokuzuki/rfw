*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${cmd}        GET_PROTOCOL_VERSION

*** Test Cases ***
Validate Command GET_PROTOCOL_VERSION
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${cmd}
    Wait And Validate Response Of Command    ${eid}    ${cmd}