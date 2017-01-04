*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     ../../Resources/mylibs.py
Suite Setup    FMS Login
Suite Teardown    Close Browser
*** Variables ***
${FMS_URL}             http://mwlora-admin.test.freestyleiot.com/   # Dev Envionment

*** Test Cases ***
Demo1
    Collect Data from CSV    7ff9011110000004    140

