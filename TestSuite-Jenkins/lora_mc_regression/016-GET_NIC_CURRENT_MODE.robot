*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_NIC_CURRENT_MODE
${para_1}         mode_id=4,MAC_polling_interval=304,spread_factor=2,poll_confirmation=0

*** Test Cases ***
Validate Command GET_NIC_CURRENT_MODE Set To Para1
    User Login By SessionID
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${para_1}    ${eid}