*** Settings ***
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot
Library     LoraRegAPI    @{environment}

*** Variables ***
${get_cmd}        GET_SUMMATION_REPORT_INTERVAL
${set_cmd}        SET_SUMMATION_REPORT_INTERVAL
${inter_min}      report_interval_mins=6
${inter_1day}     report_interval_mins=1440

*** Test Cases ***
Validate Command SET_SUMMATION_REPORT_INTERVAL To 6 mins
    User Login By SessionID
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=6         7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=16        7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=26        7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=6         7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=16        7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=26        7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=6         7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=16        7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=26        7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000047
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=6         7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=16        7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=26        7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${set_cmd}    report_interval_mins=1000      7ff9011202000114
    Sleep    3s
    SEND COMMAND TO ONE DEVICE     ${get_cmd}    report_interval_mins=1000      7ff9011202000114

