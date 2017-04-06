*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     LoraLibrary    micom

*** Variables ***
${get_cmd}        GET_SUMMATION_REPORT_INTERVAL
${set_cmd}        SET_SUMMATION_REPORT_INTERVAL
${inter_min}      report_interval_mins=6
${inter_1day}     report_interval_mins=1440

*** Test Cases ***
Validate Command SET_SUMMATION_REPORT_INTERVAL To 6 mins
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${inter_min}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${inter_min}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${inter_min}

Validate Command SET_SUMMATION_REPORT_INTERVAL To 1440 mins
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${inter_1day}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${inter_1day}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${inter_1day}