*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot

*** Variables ***
${COMMAND_INTERVAL}    20m

*** Test Cases ***
Demo1
    FMS Login
    Select GateWay    ${YL_GATEWAY}
    Sleep    30s

Demo2
    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}

    Close Browser




