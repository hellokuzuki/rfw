*** Settings ***
Library     Selenium2Library    implicit_wait=3
Library     ../Resources/validationLib.py
Library     OperatingSystem
Library     DateTime
Library     Collections
Resource    variables.robot

*** Keywords ***
Run Test Suite Setup Process
    [Documentation]    FMS login steps should be executed in test suite setup phase.
    [Arguments]    ${url}=${FMS_URL}    ${browser}=${BROWSER_FIREFOX}    ${user}=${USERNAME}    ${password}=${PASSWORD}
    FMS Login    ${url}    ${browser}    ${user}    ${password}
    Log    *************** Test Suite Setup process completed. ***************

Run Test Suite Teardown Process
    [Documentation]     Close Browser and create log folder when test suite completed.
    Close Browser
    ${date}    Get Current Date    exclude_millis=True
    Log to console    ${date}
    ${date}    Convert Date    ${date}    datetime
    ${date}    Set Variable    ${date.minute}m-${date.hour}h-${date.day}D-${date.month}M-${date.year}Y
    # Create Directory    ${EXECDIR}/Results/${date}
    # Copy Files    ${EXECDIR}/*.html    ${EXECDIR}/*.xml    ${EXECDIR}/Results/${date}
    Log    *************** Test Suite Teardown process completed. ***************

Run Test Case Teardown Process
    [Documentation]    Go to main page if certain test case failed.
    Go To Main Page

FMS Login
    [Documentation]    FMS Login process.
    [Arguments]    ${url}=${FMS_URL}    ${browser}=${BROWSER_FIREFOX}    ${user}=${USERNAME}    ${password}=${PASSWORD}
    Open Browser to the FMS index Page    ${url}    ${browser}
    Input Login Credential and then click login button    ${user}    ${password}
    Log    *************** Login to FMS successfully. ***************

Open Browser to the FMS index Page
    [Documentation]    Direct to FMS home page.
    [Arguments]    ${url}=${FMS_URL}    ${browser}=${BROWSER_FIREFOX}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Log    *************** Open Browser and direct to FMS main page. ***************

Input Login Credential and then click login button
    [Documentation]    Input username and password in login page.
    [Arguments]    ${user}=${USERNAME}    ${password}=${PASSWORD}
    Wait Until Element Is Visible    user
    Input Text    user    ${user}
    Wait Until Element Is Visible    pass
    Input Text    pass    ${password}
    Click Button    ${SIGNIN_BTN}
    Sleep    ${SHORT_DELAY}
    Log    *************** Input Login Credential. ***************

Select GateWay
    [Documentation]    Select Gateway in the Gateway colume of main page by specify gateway eid.
    [Arguments]    ${gateway_eid}
    Wait Until Element Is Visible    xpath=//div[contains(text(), "${gateway_eid}")]
    Click Element    xpath=//div[contains(text(), "${gateway_eid}")]
    Sleep    ${COMMAND_DELAY}
    Log    *************** Gateway has been selected. ***************

Go To Main Page
    [Documentation]    Direct to Device Management page of FMS.
    Wait Until Element Is Visible    ${XPATH_MENU_DEVICE_MANAGEMENT}
    Click Element    ${XPATH_MENU_DEVICE_MANAGEMENT}
    Sleep    ${COMMAND_DELAY}
    # Select GateWay    ${GATEWAY}
    Log    *************** Go to Device Managenent Page of FMS. ***************

Go To Logs Page
    [Documentation]    Direct to Logs page of FMS.
    Wait Until Element Is Visible    ${XPATH_MENU_LOGS}
    Click Element    ${XPATH_MENU_LOGS}
    Sleep    ${COMMAND_DELAY}
    Log    *************** Go to Logs Page of FMS. ***************

Click Cancel Button of Execute Page
    [Documentation]    Click cancel button of command page.
    Wait Until Element Is Visible    ${XPATH_COMMAND_CANCEL}
    Click Element    ${XPATH_COMMAND_CANCEL}

Send Out Command To EID
    [Documentation]    Send GET/SET command to Single EID
    [Arguments]    ${eid}    ${command}    ${para}=${EMPTY}
    Wait Until Element Is Visible    ${XPATH_DEVICE_DEFAULT_EID}
    Click Element    ${XPATH_DEVICE_DEFAULT_EID}
    Wait Until Element Is Visible    ${XPATH_EXE_BTN}
    Click Element    ${XPATH_EXE_BTN}
    Wait Until Element Is Visible    ${XPATH_COMMAND_EID}
    Input Text    ${XPATH_COMMAND_EID}    ${eid}
    Wait Until Element Is Visible    command
    Input Text    command    ${command}
    Wait Until Element Is Visible    cmd_args
    Input Text    cmd_args    ${para}
    Wait Until Element Is Visible    ${XPATH_COMMAND_SEND}
    Click Element    ${XPATH_COMMAND_SEND}
    Wait Until Element Is Visible    ${XPATH_COMMAND_OK}
    Click Element    ${XPATH_COMMAND_OK}
    Log    *************** Command has been sent to End Device. ***************

Send Out Command To Multiple EIDs
    [Documentation]    Send GET/SET command to multi EIDs
    [Arguments]    ${command}    ${para}=${EMPTY}    @{eids}
    :FOR    ${eid}    IN    @{eids}
    \    Wait Until Element Is Visible    ${XPATH_DEVICE_DEFAULT_EID}
    \    Click Element    ${XPATH_DEVICE_DEFAULT_EID}
    \    Wait Until Element Is Visible    ${XPATH_EXE_BTN}
    \    Click Element    ${XPATH_EXE_BTN}
    \    Wait Until Element Is Visible    ${XPATH_COMMAND_EID}
    \    Input Text    ${XPATH_COMMAND_EID}    ${eid}
    \    Wait Until Element Is Visible    command
    \    Input Text    command    ${command}
    \    Wait Until Element Is Visible    cmd_args
    \    Input Text    cmd_args    ${para}
    \    Wait Until Element Is Visible    ${XPATH_COMMAND_SEND}
    \    Click Element    ${XPATH_COMMAND_SEND}
    \    Wait Until Element Is Visible    ${XPATH_COMMAND_OK}
    \    Click Element    ${XPATH_COMMAND_OK}
    Log    *************** Command has been sent to multiple End Devices. ***************

Wait And Validate Response Of Command
    [Arguments]    ${eid}    ${command}    ${state}=${EMPTY}
    Filter Records With EID    ${eid}
    ${cid}    Get CID Of Issued Command    ${command}
    ${res}    Get Response Of Issued Command    ${cid}    ${command}
    ${status}    Validate Command    ${res}    ${command}    ${state}
    Run Keyword If    '${status}' == 'False'    Log     Validation Failed.    WARN
    Go To Main Page

Filter Records With EID
    [Arguments]    ${eid}
    Go To Logs Page
    Wait Until Element Is Visible    rp
    Select From List    rp    320
    Wait Until Element Is Visible    ${XPATH_LOGS_FIND_BTN}
    Click Element    ${XPATH_LOGS_FIND_BTN}
    Wait Until Element Is Visible    qtype
    Select From List    qtype    serial
    Wait Until Element Is Visible    q
    Input Text    q    ${eid}
    Wait Until Element Is Visible    q
    Press Key    q    \\13

Get CID Of Issued Command
    [Arguments]    ${command}
    : For    ${index}    In Range    1    5
    \    ${cmd}    Get Table Cell    ${LOGS_TABLE}    ${index}    3
    \    ${cid}        Get Table Cell    ${LOGS_TABLE}    ${index}    7
    \    ${status}     Get Table Cell    ${LOGS_TABLE}    ${index}    4
    \    Exit For Loop If    '${cid}' != 0 and '${command}' == '${cmd}' and '${status}' == 'Issued'
    Log to Console    *************** Command issued with CID ${cid} ***************
    Return From Keyword    ${cid}

Get Rows Of Data From Logs
    [Arguments]    ${request_cid}    ${reqest_cmd}
    ${data}    Set Variable   ${EMPTY}
    : For    ${index}    In Range    1    8
    \    ${id}     Get Table Cell    ${LOGS_TABLE}    ${index}    1
    \    Log To Console    Debug ==== this is id ${id}
    \    ${status}     Get Table Cell    ${LOGS_TABLE}    ${index}    4
    \    Continue For Loop If    'Responded' not in '${status}'
    \    ${cid}        Get Table Cell    ${LOGS_TABLE}    ${index}    7
    \    Continue For Loop If    '${cid}' != '${request_cid}'
    \    ${command}    Get Table Cell    ${LOGS_TABLE}    ${index}    3
    \    Continue For Loop If    '${command}' != '${reqest_cmd}'
    \    Exit For Loop If    'Responded' not in '${status}' and '${cid}' != '${request_cid}' and '${command}' != '${reqest_cmd}'
    \    ${data}       Get Table Cell    ${LOGS_TABLE}    ${index}    10
    Return From Keyword    ${data}

Get Response Of Issued Command
    [Arguments]    ${request_cid}    ${reqest_cmd}
    : For    ${minute}    In Range    1    10
    \    Wait And Click Refresh Button
    \    ${response}    Get Rows Of Data From Logs    ${request_cid}    ${reqest_cmd}
    # \    Sleep    1m
    \    Log To Console    retry = ${minute}
    \    Exit For Loop If    '${response}' != '${EMPTY}'
    Run Keyword If    '${response}' == '${EMPTY}'    Log     No Response has been returned within 15 mins    WARN
    Log To Console    ${response}
    Return From Keyword    ${response}

Wait And Click Refresh Button
    Sleep    1m
    Wait Until Element Is Visible    ${XPATH_LOGS_REFRESH_BTN}
    Click Element    ${XPATH_LOGS_REFRESH_BTN}

Create Transaction File
    [Arguments]    ${eid}
    ${date}    Get Current Date
    ${datetime}    Convert Date    ${date}    datetime
    Create File    ${EXECDIR}/${datetime.hour}H${datetime.minute}M-${datetime.day}-${datetime.month}-${datetime.year}-${eid}.txt    **** Collect Transaction Messages on ${eid} ****${\n}
    ${OPT_FILE}    Convert To String    ${datetime.hour}H${datetime.minute}M-${datetime.day}-${datetime.month}-${datetime.year}-${eid}.txt
    Set Global Variable    ${OPT_FILE}

Create Transaction CSV
    [Arguments]    ${eid}
    ${date}    Get Current Date
    ${datetime}    Convert Date    ${date}    datetime
    Create File    ${EXECDIR}/${datetime.hour}H${datetime.minute}M-${datetime.day}-${datetime.month}-${datetime.year}-${eid}.csv
    ${OPT_FILE}    Convert To String    ${datetime.hour}H${datetime.minute}M-${datetime.day}-${datetime.month}-${datetime.year}-${eid}.csv
    Append Header To CSV    ${OPT_FILE}
    Set Global Variable    ${OPT_FILE}


