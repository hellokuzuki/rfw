*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Resource    ./environment.robot
Library     LoraLibrary

*** Variables ***
${get_cmd}        GET_NIC_CURRENT_MODE

${para_1}         mode_id=4,MAC_polling_interval=304,spread_factor=2,poll_confirmation=0

${eid}    7ff9011202000168

*** Test Cases ***
Validate Command GET_NIC_CURRENT_MODE Set To Para1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_1}