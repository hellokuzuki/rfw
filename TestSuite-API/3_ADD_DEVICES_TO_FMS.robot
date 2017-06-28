*** Settings ***
Library     APILibrary
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Add Devices To FMS
    Login And Return SessionID
    Add Devices To FMS And Activate Devices     ${FMS_URL}    ${SessionID}    ${GATEWAY_EID}    ${APP_BUNDLE}    ${DEVICE_TYPE}    @{DEVICES_EID}
