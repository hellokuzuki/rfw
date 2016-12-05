*** Settings ***
Library           Selenium2Library    implicit_wait=1

*** Variables ***
${Username}       freestyle
${Password}       freestyle
${Browser}        Firefox
${SiteUrl}        http://lora-admin.dev.freestyleiot.com/
${Delay}          3s
${LongDelay}      900s

@{EIDS}           7ff9011110000004    7ff9011110000007
${Execute}        Execute
${Send}           Send
${OK}             Ok
${Logs}           Logs

${ValveOpen}      state=1
${ValveClose}     state=0

*** Test Cases ***
LoginTest
    Open Browser to the FMS index Page
    Enter User Name
    Enter Password
    Click Login

Send GET_METER_TYPE
    Send get command    GET_METER_TYPE

Send GET_METER_SUMMATION_DELIVERED
    Send get command    GET_METER_SUMMATION_DELIVERED

Send GET_METER_CURRENT_PRESSURE
    Send get command    GET_METER_CURRENT_PRESSURE

Send GET_METER_GAS_VALVE_STATE
    Send get command    GET_METER_GAS_VALVE_STATE

Send SET_METER_GAS_VALVE_STATE
    Send set command    SET_METER_GAS_VALVE_STATE    state=1
    Send get command    GET_METER_GAS_VALVE_STATE

Send SET_METER_GAS_VALVE_STATE
    Send set command    SET_METER_GAS_VALVE_STATE    state=0
    Send get command    GET_METER_GAS_VALVE_STATE

Send SET_METER_SUMMATION_SCHEDULE
    Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=0
    Send get command    GET_METER_SUMMATION_SCHEDULE
    Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=1
    Send get command    GET_METER_SUMMATION_SCHEDULE
    Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=4
    Send get command    GET_METER_SUMMATION_SCHEDULE
    Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=5
    Send get command    GET_METER_SUMMATION_SCHEDULE
    sleep    ${LongDelay}
    Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=6
    Send get command    GET_METER_SUMMATION_SCHEDULE
    sleep    ${LongDelay}
    Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=1440
    Send get command    GET_METER_SUMMATION_SCHEDULE

Send SET_METER_PRESSURE_SCHEDULE
    Send set command    SET_METER_PRESSURE_SCHEDULE    pressure_schedule=360
    Send get command    GET_METER_PRESSURE_SCHEDULE

Send GET_YL_OFLOW_DETECT_ENABLE
    Send get command    GET_YL_OFLOW_DETECT_ENABLE

Send SET_YL_OFLOW_DETECT_ENABLE
    Send set command    SET_YL_OFLOW_DETECT_ENABLE    state=1
    Send get command    GET_YL_OFLOW_DETECT_ENABLE

Send SET_YL_OFLOW_DETECT_ENABLE
    Send set command    SET_YL_OFLOW_DETECT_ENABLE    state=0
    Send get command    GET_YL_OFLOW_DETECT_ENABLE

Send GET_YL_OFLOW_DETECT_DURATION
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send SET_YL_OFLOW_DETECT_DURATION
    Send set command    SET_YL_OFLOW_DETECT_DURATION    duration=0
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send SET_YL_OFLOW_DETECT_DURATION
    Send set command    SET_YL_OFLOW_DETECT_DURATION    duration=6
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send SET_YL_OFLOW_DETECT_DURATION
    Send set command    SET_YL_OFLOW_DETECT_DURATION    duration=100
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send SET_YL_OFLOW_DETECT_DURATION
    Send set command    SET_YL_OFLOW_DETECT_DURATION    duration=999
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send SET_YL_OFLOW_DETECT_DURATION
    Send set command    SET_YL_OFLOW_DETECT_DURATION    duration=1000
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send SET_YL_OFLOW_DETECT_DURATION
    Send set command    SET_YL_OFLOW_DETECT_DURATION    duration=5
    Send get command    GET_YL_OFLOW_DETECT_DURATION

Send GET_YL_OFLOW_DETECT_RATE
    Send get command    GET_YL_OFLOW_DETECT_RATE

Send SET_YL_OFLOW_DETECT_RATE
    Send set command    SET_YL_OFLOW_DETECT_RATE    rate=10
    Send get command    GET_YL_OFLOW_DETECT_RATE

Send SET_YL_OFLOW_DETECT_RATE
    Send set command    SET_YL_OFLOW_DETECT_RATE    rate=13
    Send get command    GET_YL_OFLOW_DETECT_RATE

Send SET_YL_OFLOW_DETECT_RATE
    Send set command    SET_YL_OFLOW_DETECT_RATE    rate=40
    Send get command    GET_YL_OFLOW_DETECT_RATE

Send SET_YL_OFLOW_DETECT_RATE
    Send set command    SET_YL_OFLOW_DETECT_RATE    rate=41
    Send get command    GET_YL_OFLOW_DETECT_RATE

Send GET_YL_PRESSURE_ALARM_LEVEL_LOW
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_LOW

Send SET_YL_PRESSURE_ALARM_LEVEL_LOW
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=0
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_LOW

Send SET_YL_PRESSURE_ALARM_LEVEL_LOW
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=1
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_LOW

Send SET_YL_PRESSURE_ALARM_LEVEL_LOW
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=5
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_LOW

Send SET_YL_PRESSURE_ALARM_LEVEL_LOW
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_LOW    level=6
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_LOW

Send GET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_HIGH

Send SET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=0
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_HIGH

Send SET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=1
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_HIGH

Send SET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=5
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_HIGH

Send SET_YL_PRESSURE_ALARM_LEVEL_HIGH
    Send set command    SET_YL_PRESSURE_ALARM_LEVEL_HIGH    level=6
    Send get command    GET_YL_PRESSURE_ALARM_LEVEL_HIGH

Send GET_YL_LEAK_DETECT_RANGE
    Send get command    GET_YL_LEAK_DETECT_RANGE

Send SET_YL_LEAK_DETECT_RANGE
    Send set command    SET_YL_LEAK_DETECT_RANGE    range=0
    Send get command    GET_YL_LEAK_DETECT_RANGE

Send SET_YL_LEAK_DETECT_RANGE
    Send set command    SET_YL_LEAK_DETECT_RANGE    range=1
    Send get command    GET_YL_LEAK_DETECT_RANGE

Send SET_YL_LEAK_DETECT_RANGE
    Send set command    SET_YL_LEAK_DETECT_RANGE    range=9
    Send get command    GET_YL_LEAK_DETECT_RANGE

Send SET_YL_LEAK_DETECT_RANGE
    Send set command    SET_YL_LEAK_DETECT_RANGE    range=10
    Send get command    GET_YL_LEAK_DETECT_RANGE

Send GET_YL_MANUAL_RECOVER_ENABLE
    Send get command    GET_YL_MANUAL_RECOVER_ENABLE

Send SET_YL_MANUAL_RECOVER_ENABLE
    Send set command    SET_YL_MANUAL_RECOVER_ENABLE    state=1
    Send get command    GET_YL_MANUAL_RECOVER_ENABLE

Send SET_YL_MANUAL_RECOVER_ENABLE
    Send set command    SET_YL_MANUAL_RECOVER_ENABLE    state=0
    Send get command    GET_YL_MANUAL_RECOVER_ENABLE

Send GET_YL_FIRMWARE_VERSION
    Send get command    GET_YL_FIRMWARE_VERSION

Send GET_YL_METER_SHUTOFFCODES
    Send get command    GET_YL_METER_SHUTOFFCODES


# LoginTest
#     Open Browser to the FMS index Page
#     Enter User Name
#     Enter Password
#     Click Login

# Send GET_METER_TYPE
    # Send get command    GET_METER_TYPE
    # Send get command    GET_METER_SUMMATION_DELIVERED
    # Send get command    GET_METER_CURRENT_PRESSURE
    # # Send set command    SET_METER_GAS_VALVE_STATE    ${ValveOpen}
    # Send get command    GET_METER_GAS_VALVE_STATE
    # # Send set command    SET_METER_GAS_VALVE_STATE    ${ValveClose}
    # # Send get command    GET_METER_GAS_VALVE_STATE
    # Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=0
    # Send get command    GET_METER_SUMMATION_SCHEDULE
    # # Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=1
    # # Send get command    GET_METER_SUMMATION_SCHEDULE
    # # Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=4
    # # Send get command    GET_METER_SUMMATION_SCHEDULE
    # # Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=5
    # # Send get command    GET_METER_SUMMATION_SCHEDULE
    # # Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=6
    # # Send get command    GET_METER_SUMMATION_SCHEDULE
    # Send set command    SET_METER_SUMMATION_SCHEDULE    summation_schedule=1440
    # Send get command    GET_METER_SUMMATION_SCHEDULE
    # Send set command    SET_METER_PRESSURE_SCHEDULE    pressure_schedule=360
    # Send get command    GET_METER_PRESSURE_SCHEDULE
    # Send set command    SET_MC_METER_READING_VALUE    value=9240999
    # Send get command    GET_MC_METER_READING_VALUE
    # Send set command    SET_MC_METER_STATUS    location=10,value=10
    # Send get command    GET_MC_METER_STATUS
    # # Send set command    SET_MC_METER_CUSTOMER_ID    id=01600000010272
    # # Send get command    GET_MC_METER_CUSTOMER_ID
    # Send set command    SET_MC_METER_TIME    time=1479705310
    # Send get command    GET_MC_METER_TIME
    # # Send get command    SET_MC_CONFIG_CENTER_SHUTDOWN
    # # Send get command    SET_MC_CONFIG_DISABLE_CENTER_SHUTDOWN

*** Keywords ***
Open Browser to the FMS index Page
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter User Name
    Input Text    user    ${Username}

Enter Password
    Input Text    pass    ${Password}

Click Login
    Click Button    Sign in
    sleep    ${Delay}

Click GW
    Click Element    xpath=//span[contains(text(), "990200000000269b")]
    sleep    ${Delay}

Send get command
    [Arguments]    ${command}
    :FOR    ${EID}    IN    @{EIDS}
    \    Click Element    xpath=//div[contains(text(), "${EID}")]
    \    sleep    ${Delay}
    \    Click Element    xpath=//span[contains(text(), "${Execute}")]
    \    sleep    ${Delay}
    \    Input Text    command    ${command}
    \    sleep    ${Delay}
    \    Click Element    xpath=//span[contains(text(), "${Send}")]
    \    Click Element    xpath=//span[contains(text(), "${Ok}")]
    \    sleep    ${Delay}
    sleep    ${LongDelay}

Send set command
    [Arguments]    ${command}    ${para}
    :FOR    ${EID}    IN    @{EIDS}
    \    Click Element    xpath=//div[contains(text(), "${EID}")]
    \    sleep    ${Delay}
    \    Click Element    xpath=//span[contains(text(), "${Execute}")]
    \    sleep    ${Delay}
    \    Input Text    command    ${command}
    \    sleep    ${Delay}
    \    Input Text    cmd_args    ${para}
    \    sleep    ${Delay}
    \    Click Element    xpath=//span[contains(text(), "${Send}")]
    \    Click Element    xpath=//span[contains(text(), "${Ok}")]
    \    sleep    ${Delay}
    sleep    ${LongDelay}

Go to logs Page
    Click Element    xpath=//span[contains(text(), "${Logs}")]