*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${cmd}    GET_APP_DETAILS

*** Test Cases ***
Validate commnad GET_APP_DETAILS
    User Login By SessionID
    Send Command And Validate Response    ${cmd}    ${EMPTY}    ${EMPTY}    ${eid}
