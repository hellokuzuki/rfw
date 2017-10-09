*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_NIC_MODE
${set_cmd}        SET_NIC_MODE

${para_1}         mode_id=3,MAC_polling_interval=303,spread_factor=3,poll_confirmation=1
${mode_1}         mode_id=3

${para_2}         mode_id=4,MAC_polling_interval=304,spread_factor=2,poll_confirmation=0
${mode_2}         mode_id=4

${para_3}         mode_id=5,MAC_polling_interval=305,spread_factor=1,poll_confirmation=1
${mode_3}         mode_id=5

*** Test Cases ***
Validate Command SET_NIC_MODE Set To Para1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${para_1}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}    ${mode_1}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_1}

Validate Command SET_NIC_MODE Set To Para2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${para_2}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}    ${mode_2}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_2}

Validate Command SET_NIC_MODE Set To Para3
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${para_3}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}    ${mode_3}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${para_3}