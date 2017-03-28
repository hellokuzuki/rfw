*** Settings ***
Library    Selenium2Library
Metadata            Lua App Version        *&{Metadata}[LUA_VER]*
Metadata            Firmware Version       *&{Metadata}[FW_VER]*
Metadata            Admin GUI URL          *&{Metadata}[FMS_URL]*

*** Variables ***
${var}    inside test!!!!!!!!!!!!
&{Metadata}         LUA_VER=APL-LMT-YL01-1.0.15-STB
...                 FW_VER=LORA-PL-1.0.109-STG
...                 FMS_URL=http://mwlora-admin.test.freestyleiot.com/  # Mark's Testing Switch

*** Test Cases ***
Demo
    Open Browser    http://www.google.com.au    firefox
    Log To Console    ${var}
    Log To COnsole    ${FW_VER}
    Sleep    5s
    Close Browser
