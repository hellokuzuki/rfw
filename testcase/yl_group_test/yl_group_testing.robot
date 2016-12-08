*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${FMS_URL}    http://mwlora-admin.test.freestyleiot.com
${COMMAND_INTERVAL}    1h

@{YL_EIDS}    7ff9011020000080
# ...               7ff9011020000082    not working.
...               7ff9011020000077
...               7ff9011020000076
# ...               7ff9011020000075    not working.
# ...               7ff9011020000074    not working.
...               7ff9011020000073
...               7ff9011020000072
...               7ff9011020000071
...               7ff9011020000069
...               7ff9011020000068
...               7ff9011020000067
...               7ff9011020000065
...               7ff9011020000064
...               7ff9011020000063

*** Test Cases ***
Checking Connectivity
    Select GateWay    ${TEST_GATEWAY}
    # Have to manually sort and resize the end devices col. so put 30 secs.
    Sleep    30s
    :FOR    ${x}    IN RANGE    10
    \    Loop For Get Commands

*** Keywords ***
Loop For Get Commands
    : FOR    ${COMMAND}    IN     @{YL_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{YL_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}





