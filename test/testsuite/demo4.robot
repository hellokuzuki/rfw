*** Settings ***
# Library    Selenium2Library
# Library             LoraLibrary    micom
Resource    ../../Resources/keywords_ref.robot
Metadata            Lua App Version        *&{Metadata}[LUA_VER]*
Metadata            Firmware Version       *&{Metadata}[FW_VER]*
Metadata            Admin GUI URL          *&{Metadata}[FMS_URL]*
# Suite Teardown      Close Browser

*** Variables ***
&{Metadata}         LUA_VER=APL-LMT-YL01-1.0.15-STB
...                 FW_VER=LORA-PL-1.0.109-STG
...                 FMS_URL=http://mwlora-admin.test.freestyleiot.com/  # Mark's Testing Switch

*** Test Cases ***
Demo
    Import Library    LoraLibrary    micom
    SHOW TYPE