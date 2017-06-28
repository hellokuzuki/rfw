*** Settings ***
Library     APILibrary
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Delete Devices From FMS
    Login And Return SessionID
    Delete APP And Remove Devices FROM FMS    ${FMS_URL}    ${SessionID}    @{DEVICES_EID}
