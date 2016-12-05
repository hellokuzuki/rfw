*** Settings ***
Resource    ../Resources/variables.robot
Resource    ../Resources/keywords.robot

*** Test Cases ***
Demo1
    FMS Login
    Select GateWay    ${YL_GATEWAY}
    Sleep    30s

Demo2
    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    20m

    Close Browser






