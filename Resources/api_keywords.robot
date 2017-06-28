*** Settings ***
Library     APILibrary
# Library     OperatingSystem
# Library     DateTime
# Library     Collections
Resource    api_variables.robot

*** Keywords ***
Login And Return SessionID
    [Documentation]    Login to the system and return session id by using API
    [Arguments]    ${url}=${FMS_URL}    ${user}=${USER}    ${password}=${PASSWORD}
    ${SessionID}    User Login    ${url}    ${user}    ${password}
    Set Global Variable    ${SessionID}
    ${STARTTIME}    Get UTC Time
    Set Global Variable    ${STARTTIME}

Get Online Devices Info
    [Arguments]    ${url}=${FMS_URL}    ${session}=${SessionID}
    ${len}    Get Length    @{Devices}
    @{Devices}    Run Keyword If     ${len} == 0    Get All Online Devices    ${url}    ${session}
    Run Keyword If     ${len} == 0     Set Global Variable    @{Devices}

Send Command To Device And Return CID
    [Arguments]    ${url}=${FMS_URL}    ${session}=${SessionID}    ${command}=${EMPTY}    ${eid}=${EMPTY}    ${params}=${EMPTY}
    ${CID}    Device Send Command    ${url}    ${session}    ${command}    ${eid}    ${params}
    Set Global Variable    ${CID}
    Log to Console    *************** Command issued with CID : ${cid} ***************

Get Response And Validate
    [Arguments]     ${url}=${FMS_URL}    ${session}=${SessionID}    ${command}=${EMPTY}    ${eid}=${EMPTY}
    : For    ${mins}    In Range    1    ${Retry_Times}
    \     Log To Console    *** Retrying ${mins} times ***
    \     Sleep    ${Retry_Interval}
    \     ${response}    Run Keyword If    '${CID}' > 0    Get Transaction    ${url}    ${session}    ${command}    ${eid}    ${CID}
    \     Continue For Loop If    ${response} is ${None}
    \     Log To Console    *** Response of request has been returned : ${response} ***
    \     Exit For Loop If    ${response} != ${None}

    Check Response     ${response}
    Run Keyword If    ${response} is ${None}    Log To Console    *************** No response has been returned. ***************
    ${response}    Run Keyword If    ${response} != ${None}    Return From Keyword    ${response}

Add Devices To FMS And Activate Devices
    [Arguments]     ${url}=${FMS_URL}    ${session}=${SessionID}    ${GATEWAY_EID}=${EMPTY}    ${APP_BUNDLE}=${EMPTY}    ${DEVICE_TYPE}=${EMPTY}    @{DEVICES_EID}
    FMS Add Devices    ${FMS_URL}    ${SessionID}    ${GATEWAY_EID}    ${APP_BUNDLE}    ${DEVICE_TYPE}    @{DEVICES_EID}
    FMS Activate Devices    ${FMS_URL}    ${SessionID}    ${GATEWAY_EID}    @{DEVICES_EID}

Delete APP And Remove Devices FROM FMS
    [Arguments]     ${url}=${FMS_URL}    ${session}=${SessionID}    @{DEVICES_EID}
    FMS Device Remove App    ${FMS_URL}    ${SessionID}    @{DEVICES_EID}
    FMS Remove Devices    ${FMS_URL}    ${SessionID}    @{DEVICES_EID}

Delete APp And Install New App
    [Arguments]     ${url}=${FMS_URL}    ${session}=${SessionID}    @{DEVICES_EID}
    FMS Device Remove App    ${FMS_URL}    ${SessionID}    @{DEVICES_EID}



