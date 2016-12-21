*** Settings ***
Library     Selenium2Library    implicit_wait=1
Library     ../Resources/mylibs.py
Library     OperatingSystem
Library     DateTime
Library     Collections
Resource    variables.robot

*** Keywords ***
Open Browser to the FMS index Page
    Open Browser    ${FMS_URL}    ${BROWSER_FIREFOX}
    Maximize Browser Window
    Log To Console    ${LOG_PREFIX} "Open Browser to the FMS index Page" has been executed.

Input Login User Name
    Wait Until Element Is Visible    user
    Input Text    user    ${USERNAME}
    Log To Console    ${LOG_PREFIX} "Input Login User Name" has been executed.

Input Login Password
    Wait Until Element Is Visible    pass
    Input Text    pass    ${PASSWORD}
    Log To Console    ${LOG_PREFIX} "Input Login Password" has been executed.

Click Login Button
    Click Button    ${SIGNIN_BTN}
    Log To Console    ${LOG_PREFIX} "Click Login Button" has been executed.

Wait for Login Process
    Sleep    ${SHORT_DELAY}
    Log To Console    ${LOG_PREFIX} "Wait for Login Process" has been executed.

Select GateWay
    [Arguments]    ${gateway_eid}
    Wait Until Element Is Visible    xpath=//div[contains(text(), "${gateway_eid}")]
    Click Element    xpath=//div[contains(text(), "${gateway_eid}")]
    Sleep    ${COMMAND_DELAY}
    Log To Console    ${LOG_PREFIX} "Select GateWay" has been executed.

FMS Login
    Open Browser to the FMS index Page
    Input Login User Name
    Input Login Password
    Click Login Button
    Wait for Login Process
    Log To Console    ${LOG_PREFIX} "FMS Login" has been executed.

Go To Logs Page
    Wait Until Element Is Visible    xpath=//li[contains(@class, "${LOGS}")]
    Click Element    xpath=//li[contains(@class, "${LOGS}")]
    Sleep    ${COMMAND_DELAY}
    Log To Console    ${LOG_PREFIX} "Go To Logs Page" has been executed.


Click Device EID
    [Arguments]    ${device_eid}
    Wait Until Element Is Visible    xpath=//div[contains(text(), "${device_eid}")]
    Click Element    xpath=//div[contains(text(), "${device_eid}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click Device EID" ${device_eid} has been executed.

Click Execute Button
    Wait Until Element Is Visible    xpath=//span[contains(text(), "${EXECUTE_BUTTON}")]
    Click Element    xpath=//span[contains(text(), "${EXECUTE_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click Execute Button" has been executed.

Input Command
    [Arguments]    ${command}
    Wait Until Element Is Visible    command
    Input Text    command    ${command}
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Input Command" ${command} has been executed.

Input Parameter
    [Arguments]    ${parameter}
    Wait Until Element Is Visible    cmd_args
    Input Text    cmd_args    ${parameter}
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Input Parameter" ${parameter} has been executed.

Click Send Button
    Wait Until Element Is Visible    xpath=//span[contains(text(), "${SEND_BUTTON}")]
    Click Element    xpath=//span[contains(text(), "${SEND_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click Send Button" has been executed.

Click OK Button
    Wait Until Element Is Visible    xpath=//span[contains(text(), "${OK_BUTTON}")]
    Click Element    xpath=//span[contains(text(), "${OK_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click OK Button" has been executed.

Click Cancel Button
    Wait Until Element Is Visible    xpath=//span[contains(text(), "${CANCEL_BUTTON}")]
    Click Element    xpath=//span[contains(text(), "${CANCEL_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click OK Button" has been executed.

Send Get Command To Single Device
    [Arguments]    ${command}
    Log To Console    ${LOG_PREFIX} Send Get Command ${command} To Single Device ${EID} started.
    Click Device EID    ${EID}
    Click Execute Button
    Input Command    ${command}
    Click Send Button
    Click OK Button
    Log To Console    ${LOG_PREFIX} Send Get Command ${command} To Single Device ${EID} has been executed.

Send Get Command To Group Devices
    [Arguments]    ${command}    @{eids}
    :FOR    ${eid}    IN    @{eids}
    \    Log To Console    ${LOG_PREFIX} Send Get Command ${command} To Group Device ${eid} started.
    \    Click Device EID    ${eid}
    \    Click Execute Button
    \    Input Command    ${command}
    \    Click Send Button
    \    Click OK Button
    \    Log To Console    ${LOG_PREFIX} Send Get Command ${command} To Group Device ${eid} has been executed.

Send Set Command To Single Device
    [Arguments]    ${command}    ${para}
    Log To Console    ${LOG_PREFIX} Send Set Command ${command} To Single Device to ${EID} with parameter ${para} started.
    Click Device EID    ${EID}
    Click Execute Button
    Input Command    ${command}
    Input Parameter    ${para}
    Click Send Button
    Click OK Button
    Log To Console    ${LOG_PREFIX} Send Set Command ${command} To Single Device to ${EID} with parameter ${para} has been executed.

Send Set Command To Group Devices
    [Arguments]    ${command}    ${para}    @{eids}
    :FOR    ${eid}    IN    @{eids}
    \    Log To Console    ${LOG_PREFIX} Send Set Command ${command} To Group Device to to ${eid} with parameter ${para} started.
    \    Click Device EID    ${eid}
    \    Click Execute Button
    \    Input Command    ${command}
    \    Input Parameter    ${para}
    \    Click Send Button
    \    Click OK Button
    \    Log To Console    ${LOG_PREFIX} Send Set Command ${command} To Group Device to to ${eid} with parameter ${para} has been executed.

# Group testing Keywords for MC NICs
# Loop For Get Commands
#     : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
#     \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
#     \    Sleep    ${COMMAND_INTERVAL}

# Group testing Keywords for YL NICs
# Loop For Get Commands
#     : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
#     \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
#     \    Sleep    ${COMMAND_INTERVAL}

Filter Records With EID
    [Arguments]    ${eid}
    Go To Logs Page
    Wait Until Element Is Visible    rp
    Select From List    rp    320
    Wait Until Element Is Visible    xpath=//div[contains(@class, "${FIND_BTN}")]
    Click Element    xpath=//div[contains(@class, "${FIND_BTN}")]
    Wait Until Element Is Visible    qtype
    Select From List    qtype    serial
    Wait Until Element Is Visible    q
    Input Text    q    ${eid}
    Wait Until Element Is Visible    q
    Press Key    q    \\13

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

Get Row Of Transaction
    [Arguments]    ${index}
    # Wait Until Element Is Visible    xpath=//table[contains(@class, "${LOGS_TABLE}")]
    ${time}       Get Table Cell    flexi-logs    ${index}    2
    Log to console    ${time}
    ${command}    Get Table Cell    flexi-logs    ${index}    3
    Log to console    ${command}
    ${status}     Get Table Cell    flexi-logs    ${index}    4
    Log to console    ${status}
    ${device}     Get Table Cell    flexi-logs    ${index}    6
    Log to console    ${device}
    ${cid}        Get Table Cell    flexi-logs    ${index}    7
    Log to console    ${cid}
    ${data}       Get Table Cell    flexi-logs    ${index}    10
    Log to console    ${data}
    @{record}    Create List    ${EMPTY}
    ${string}    Set Variable   ${EMPTY}
    Append To List    ${record}    ${time}    ${command}    ${status}    ${device}    ${cid}    ${data}
    ${string}    Catenate    @{record}
    ${record_list}    Convert To List    ${record}
    Append List To CSV    ${OPT_FILE}    ${record_list}

Collect Data from CSV
    [Arguments]    ${eid}    ${range}
    Filter Records With EID    ${eid}
    Create Transaction CSV    ${eid}
    :For    ${x}    In Range    1    ${range}
    \    Get Row Of Transaction    ${x}
