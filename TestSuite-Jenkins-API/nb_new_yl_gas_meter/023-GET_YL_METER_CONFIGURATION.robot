*** Settings ***
Library     LoraRegAPI    TestData.xlsx    NB SERVER
Resource    ../../Resources/regression_api_keywords.robot
Resource    ../../Resources/regression_api_setting.robot

*** Variables ***
${get_cmd}                          GET_YL_METER_CONFIGURATION

${extend_use_time}                  SET_YL_METER_EXTEND_USE_TIME
${extend_use_time_para1}            extend_action=2,extend_time=1440
${extend_use_time_para2}            extend_action=2,extend_time=1000
${extend_use_time_para3}            extend_action=0,extend_time=60

${pressure_alarm_level_high}        SET_YL_PRESSURE_ALARM_LEVEL_HIGH
${preesure_high_para1}              high_Pressure_action=1,high_pressure=500
${preesure_high_para2}              high_Pressure_action=2,high_pressure=999
${preesure_high_para3}              high_Pressure_action=0,high_pressure=100

${pressure_alarm_level_low}         SET_YL_PRESSURE_ALARM_LEVEL_LOW
${preesure_low_para1}               low_pressure_action=1,low_pressure_min=0,low_pressure_max=0
${preesure_low_para2}               low_pressure_action=2,low_pressure_min=99,low_pressure_max=99
${preesure_low_para3}               low_pressure_action=0,low_pressure_min=0,low_pressure_max=99

${leak_detect_range}                SET_YL_LEAK_DETECT_RANGE
${leak_range_para1}                 leak_action=1,leak_shutoff_day=0,leak_range_min=0,leak_range_max=1
${leak_range_para2}                 leak_action=2,leak_shutoff_day=255,leak_range_min=99,leak_range_max=100
${leak_range_para3}                 leak_action=0,leak_shutoff_day=7,leak_range_min=0,leak_range_max=100

${validate_para1}                   extend_action=2,extend_time=1440,high_Pressure_action=1,high_pressure=500,low_pressure_action=1,low_pressure_min=0,low_pressure_max=0,leak_action=1,leak_shutoff_day=0,leak_range_min=0,leak_range_max=1

${validate_para2}                   extend_action=2,extend_time=1000,high_Pressure_action=2,high_pressure=999,low_pressure_action=2,low_pressure_min=99,low_pressure_max=99,leak_action=2,leak_shutoff_day=255,leak_range_min=99,leak_range_max=100

${validate_para3}                   extend_action=0,extend_time=60,high_Pressure_action=0,high_pressure=100,low_pressure_action=0,low_pressure_min=0,low_pressure_max=99,leak_action=0,leak_shutoff_day=7,leak_range_min=0,leak_range_max=100

*** Test Cases ***
Validate Command SET_YL_METER_EXTEND_USE_TIME with para1
    User Login By SessionID
    Send Command And Validate Response    ${extend_use_time}    ${extend_use_time_para1}    ${EMPTY}    ${eid}

Validate Command SET_YL_PRESSURE_ALARM_LEVEL_HIGH with para1
    Send Command And Validate Response    ${pressure_alarm_level_high}    ${preesure_high_para1}    ${EMPTY}    ${eid}

Validate Command Validate Command SET_YL_PRESSURE_ALARM_LEVEL_LOW with para1
    Send Command And Validate Response    ${pressure_alarm_level_low}    ${preesure_low_para1}    ${EMPTY}    ${eid}

Validate Command Validate Command SET_YL_LEAK_DETECT_RANGE with para1
    Send Command And Validate Response    ${leak_detect_range}    ${leak_range_para1}    ${EMPTY}    ${eid}

Validate Command Validate Command GET_YL_METER_CONFIGURATION with response1
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${validate_para1}    ${eid}

Validate Command SET_YL_METER_EXTEND_USE_TIME with para2
    Send Command And Validate Response    ${extend_use_time}    ${extend_use_time_para2}    ${EMPTY}    ${eid}

Validate Command SET_YL_PRESSURE_ALARM_LEVEL_HIGH with para2
    Send Command And Validate Response    ${pressure_alarm_level_high}    ${preesure_high_para2}    ${EMPTY}    ${eid}

Validate Command Validate Command SET_YL_PRESSURE_ALARM_LEVEL_LOW with para2
    Send Command And Validate Response    ${pressure_alarm_level_low}    ${preesure_low_para2}    ${EMPTY}    ${eid}

Validate Command Validate Command SET_YL_LEAK_DETECT_RANGE with para2
    Send Command And Validate Response    ${leak_detect_range}    ${leak_range_para2}    ${EMPTY}    ${eid}

Validate Command Validate Command GET_YL_METER_CONFIGURATION with response2
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${validate_para2}    ${eid}

Validate Command SET_YL_METER_EXTEND_USE_TIME with para3
    Send Command And Validate Response    ${extend_use_time}    ${extend_use_time_para3}    ${EMPTY}    ${eid}

Validate Command SET_YL_PRESSURE_ALARM_LEVEL_HIGH with para3
    Send Command And Validate Response    ${pressure_alarm_level_high}    ${preesure_high_para3}    ${EMPTY}    ${eid}

Validate Command Validate Command SET_YL_PRESSURE_ALARM_LEVEL_LOW with para3
    Send Command And Validate Response    ${pressure_alarm_level_low}    ${preesure_low_para3}    ${EMPTY}    ${eid}

Validate Command Validate Command SET_YL_LEAK_DETECT_RANGE with para3
    Send Command And Validate Response    ${leak_detect_range}    ${leak_range_para3}    ${EMPTY}    ${eid}

Validate Command Validate Command GET_YL_METER_CONFIGURATION with response3
    Send Command And Validate Response    ${get_cmd}    ${EMPTY}    ${validate_para3}    ${eid}

