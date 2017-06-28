*** Settings ***
Library     APILibrary    test.xlsx
Resource    ../../Resources/api_keywords.robot
Resource    ../../Resources/api_variables.robot

*** Variables ***

*** Test Cases ***
Validate Command
    # Login And Return SessionID
    # Run Test Suite Teardown Process
    # create Session File
    # User Login    http://10.10.20.225:83    freestyle    freestyle



    # Login And Return SessionID
    # Get Online Devices Info

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    METER_READ_CURRENT    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    METER_READ_CURRENT    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    METER_OPEN_VALVE    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    METER_OPEN_VALVE    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    METER_CLOSE_VALVE    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    METER_CLOSE_VALVE    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    GET_METER_VERSION    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    GET_METER_VERSION    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    GET_METER_NUMBER    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    GET_METER_NUMBER    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    GET_USER_NUMBER    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    GET_USER_NUMBER    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    GET_ALERT_THRESHOLD    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    GET_ALERT_THRESHOLD    7ff9010000000001
    # Log To Console    ${Status}

    # Send Command To Device And Return CID    ${FMS_URL}    ${SessionID}    GET_BUY_NUMBER    7ff9010000000001
    # ${Status}    Get Response And Validate    ${FMS_URL}    ${SessionID}    GET_BUY_NUMBER    7ff9010000000001
    # Log To Console    ${Status}


    # Add Nodes To AS    @{AS_DEV_EUIs}
    # Delete Nodes From AS    @{AS_DEV_EUIs}

    # FMS Add Devices    ${FMS_URL}    ${SessionID}    ${GATEWAY_EID}    ${APP_BUNDLE}    ${DEVICE_TYPE}    7ff9010202000005
    # FMS Activate Devices    ${FMS_URL}    ${SessionID}    ${GATEWAY_EID}    7ff9010202000005
    # # FMS Device Remove App    ${FMS_URL}    ${SessionID}    7ff9010202000005
    # Sleep    10s
    # FMS Remove Devices    ${FMS_URL}    ${SessionID}    7ff9010202000005
    # # Get Devices    ${FMS_URL}    ${SessionID}
    # Get Response And Validate    ${FMS_URL}    ${SessionID}    GET_BUY_NUMBER    7ff9010202000005

    # get_by_header    devices    YL EID
    # get_by_header    enviornment    TEST LAB SERVER
    # # get_by_header    enviornment    TEST SERVER

