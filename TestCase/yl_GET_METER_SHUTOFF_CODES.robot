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

${eid}              7ff9011202000003
${gw}               990200000000269f


${get_cmd}          GET_METER_SHUTOFF_CODES

*** Test Cases ***
Validate Command GET_METER_SHUTOFF_CODES
    Select GateWay      ${gw}
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m
    Send Out Command To EID    ${eid}    ${get_cmd}
    Sleep    5m