*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${cmd}        SET_CONFIG_DISABLE_CENTER_SHUTDOWN

*** Test Cases ***
Validate Command SET_CONFIG_DISABLE_CENTER_SHUTDOWN
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${cmd}
    Wait And Validate Response Of Command    ${eid}    ${cmd}