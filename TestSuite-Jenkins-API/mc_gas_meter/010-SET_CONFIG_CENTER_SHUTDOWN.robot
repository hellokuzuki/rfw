*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${cmd}      SET_CONFIG_CENTER_SHUTDOWN

*** Test Cases ***
Validate Command SET_CONFIG_CENTER_SHUTDOWN
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}