*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${cmd}        GET_NIC_VERSION

*** Test Cases ***
Validate Command GET_NIC_VERSION
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${FW_VER}    ${eid}
