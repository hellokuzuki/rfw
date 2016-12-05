*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot

*** Test Cases ***
Demo1
    FMS Login
    Select GateWay    ${MC_GATEWAY}
    Sleep    30s
Demo2
    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m

    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    20m