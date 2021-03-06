*** Settings ***
Library             DateTime
Resource            ../../Resources/keywords.robot
Suite Setup         Run Test Suite Setup Process    ${FMS_URL}    FireFox    ${USERNAME}    ${PASSWORD}
Suite Teardown      Run Test Suite Teardown Process
Test Setup          Log To Console    ${EMPTY}
Test Teardown       Run Test Case Teardown Process
############ Metadata of Results Page   ############
Metadata            Lua App Version        *&{Metadata}[LUA_VER]*
Metadata            Firmware Version       *&{Metadata}[FW_VER]*
Metadata            Admin GUI URL          *&{Metadata}[FMS_URL]*

*** Variables ***
############ Version Information        ############
&{Metadata}         LUA_VER=APL-LMT-YL01-1.0.15-STB
...                 FW_VER=LORA-PL-1.0.109-STG
...                 FMS_URL=http://mwlora-admin.test.freestyleiot.com/  # Mark's Testing Switch
                    #http://lora-admin.dev.freestyleiot.com/       # Development Switch
                    #http://lora-yl-admin.cloud.freestyleiot.com/  # Taiwan Production Switch

############ Environment Information    ############
${FMS_URL}          http://10.10.10.125:83  #http://mwlora-admin.test.freestyleiot.com/     # Mark's Testing Switch
${USERNAME}         freestyle
${PASSWORD}         freestyle

${eid}        7ff9011202000001
${gw}         990200000000269f
