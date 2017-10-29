*** Settings ***
Library     LoraRegAPI    TestData.xlsx    TEST SERVER
# Resource    api_variables.robot

*** Keywords ***
Send Command And Validate Response
    [Documentation]    Login to the system and return session id by using API
    [Arguments]    ${cmd}    ${para}    ${validator}    ${eid}
    ${cid}    SEND COMMAND TO ONE DEVICE     ${cmd}    ${para}    ${eid}
    Log To Console    *** cid = ${cid}
    ${data}    GET COMMAND RESPONSE    ${cmd}    ${cid}    ${eid}
    Log To Console    *** data = ${data}
    ${status}    VALIDATE COMMAND RESPONSE    ${data}    ${validator}
    RUN KEYWORD IF    '${status}' == 'False'    FAIL    Command Response validation failed ! !
    RUN KEYWORD IF    '${status}' == 'True'     Log To Console    Command Response validation Successed ! !




