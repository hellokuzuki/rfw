*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Suite Setup    FMS Login
Suite Teardown    Close Browser

*** Variables ***
${FMS_URL}    http://mwlora-admin.test.freestyleiot.com
${COMMAND_INTERVAL}    1h

@{MC_EIDS}        7ff9011020000100
...               7ff9011020000099
...               7ff9011020000098
...               7ff9011020000097
...               7ff9011020000096
...               7ff9011020000095
...               7ff9011020000094
...               7ff9011020000093
...               7ff9011020000091
...               7ff9011020000090
...               7ff9011020000089
...               7ff9011020000088
...               7ff9011020000087
...               7ff9011020000086
...               7ff9011020000085

*** Test Cases ***
Checking Connectivity
    Select GateWay    ${TEST_GATEWAY}
    # Have to manually sort and resize the end devices col. so put 30 secs.
    Sleep    30s
    :FOR    ${x}    IN RANGE    10
    \    Loop For Get Commands

*** Keywords ***
Loop For Get Commands
    : FOR    ${COMMAND}    IN     @{MC_GET_COMMAND}
    \    Send Get Command To Group Devices    ${COMMAND}    @{MC_EIDS}
    \    Sleep    ${COMMAND_INTERVAL}