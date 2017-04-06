*** Settings ***
Resource            ../Resources/keywords.robot
Resource            ../Resources/variables.robot
Library             ../Resources/validationLib.py

Suite Setup         Run Test Suite Setup Process    ${FMS_URL}    FireFox    ${USERNAME}    ${PASSWORD}
Suite Teardown      Run Test Suite Teardown Process
Test Teardown       Run Test Case Teardown Process

*** Variables ***
${FMS_URL}          http://10.10.10.125:83  #http://mwlora-admin.test.freestyleiot.com/     # Mark's Testing Switch
${USERNAME}         freestyle
${PASSWORD}         freestyle

${eid}              7ff9011202000005
${gw}               990200000000269f

${get_cmd}          GET_OFLOW_DETECT_ENABLE
${set_cmd}          SET_OFLOW_DETECT_ENABLE
${disable}          overflow_detect_enable=0
${enable}           overflow_detect_enable=1

*** Test Cases ***
Validate Command SET_OFLOW_DETECT_ENABLE Disable 1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 1
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 2
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 3
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 3
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 4
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 4
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 5
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 5
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 6
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 6
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 7
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 7
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 8
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 8
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 9
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 9
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 10
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 10
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 11
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 11
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 12
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 12
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}

Validate Command SET_OFLOW_DETECT_ENABLE Disable 13
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${disable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${disable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${disable}

Validate Command SET_OFLOW_DETECT_ENABLE Enable 13
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${set_cmd}    ${enable}
    Wait And Validate Response Of Command    ${eid}    ${set_cmd}    ${enable}

    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Wait And Validate Response Of Command    ${eid}    ${get_cmd}    ${enable}



