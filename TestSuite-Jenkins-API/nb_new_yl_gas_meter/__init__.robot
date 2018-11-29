*** Settings ***
Resource    ../../Resources/regression_api_setting.robot

############ Metadata of Results Page   ############
Metadata            Lua App Version        *&{Metadata}[YL_LUA_VER]*
Metadata            Firmware Version       *&{Metadata}[FW_VER]*
Metadata            Admin GUI URL          *&{Metadata}[FMS_URL]*
Metadata            Device EID             *&{Metadata}[YL_DEV_EID]*
*** Variables ***
############ Version Information        ############
&{Metadata}         YL_LUA_VER=APL-LMT-YL01-1.0.15-STB
...                 FW_VER=LORA-PL-1.0.109-STG
...                 FMS_URL=http://mwlora-admin.test.freestyleiot.com/  # Mark's Testing Switch
...                 YL_DEV_EID=${eid}
