*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${cmd}        GET_METER_VERSION
${FW_VER}     1.0.109-STG

*** Test Cases ***
Validate Command GET_METER_VERSION
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${cmd}
    Wait And Validate Response Of Command    ${eid}    ${cmd}    ${FW_VER}
