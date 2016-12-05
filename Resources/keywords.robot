*** Settings ***
Library     Selenium2Library    implicit_wait=1
Resource    variables.robot

*** Keywords ***
Open Browser to the FMS index Page
    Open Browser    ${FMS_URL}    ${BROWSER_FIREFOX}
    Maximize Browser Window
    Log To Console    ${LOG_PREFIX} "Open Browser to the FMS index Page" has been executed.

Input Login User Name
    Input Text    user    ${USERNAME}
    Log To Console    ${LOG_PREFIX} "Input Login User Name" has been executed.

Input Login Password
    Input Text    pass    ${PASSWORD}
    Log To Console    ${LOG_PREFIX} "Input Login Password" has been executed.

Click Login Button
    Click Button    Sign in
    Log To Console    ${LOG_PREFIX} "Click Login Button" has been executed.

Wait for Login Process
    Sleep    ${SHORT_DELAY}
    Log To Console    ${LOG_PREFIX} "Wait for Login Process" has been executed.

Select GateWay
    [Arguments]    ${gateway_eid}
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

Click Device EID
    [Arguments]    ${device_eid}
    Click Element    xpath=//div[contains(text(), "${device_eid}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click Device EID" ${device_eid} has been executed.

Click Execute Button
    Click Element    xpath=//span[contains(text(), "${EXECUTE_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click Execute Button" has been executed.

Input Command
    [Arguments]    ${command}
    Input Text    command    ${command}
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Input Command" ${command} has been executed.

Input Parameter
    [Arguments]    ${parameter}
    Input Text    cmd_args    ${parameter}
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Input Parameter" ${parameter} has been executed.

Click Send Button
    Click Element    xpath=//span[contains(text(), "${SEND_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click Send Button" has been executed.

Click OK Button
    Click Element    xpath=//span[contains(text(), "${OK_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click OK Button" has been executed.

Click Cancel Button
    Click Element    xpath=//span[contains(text(), "${CANCEL_BUTTON}")]
    Sleep    ${COMMAND_DELAY}
    # Log To Console    ${LOG_PREFIX} "Click OK Button" has been executed.

Send Get Command To Single Device
    [Arguments]    ${command}    ${eid}
    Log To Console    ${LOG_PREFIX} Send Get Command ${command} To Single Device ${eid} started.
    Click Device EID    ${eid}
    Click Execute Button
    Input Command    ${command}
    Click Send Button
    Click OK Button
    Log To Console    ${LOG_PREFIX} Send Get Command ${command} To Single Device ${eid} has been executed.

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
    [Arguments]    ${command}    ${para}    ${eid}
    Log To Console    ${LOG_PREFIX} Send Set Command ${command} To Single Device to ${eid} with parameter ${para} started.
    Click Device EID    ${eid}
    Click Execute Button
    Input Command    ${command}
    Input Parameter    ${para}
    Click Send Button
    Click OK Button
    Log To Console    ${LOG_PREFIX} Send Set Command ${command} To Single Device to ${eid} with parameter ${para} has been executed.

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