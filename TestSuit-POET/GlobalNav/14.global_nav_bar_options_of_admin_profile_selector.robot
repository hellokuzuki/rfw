*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Global Nav Bar Options Of Admin Profile Selector
    [Documentation]    The Profile selector shows the following options in the drop down list
    Run Login Process
    Click Element    ${PROFILE_DROPDOWN}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_PROFILE}    ${TEXT_PROFILE_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_EDIT}    ${TEXT_SETTING_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_CHPW}    ${TEXT_CHANGE_PW_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_HELP}    ${TEXT_HELP_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_LOGOUT}    ${TEXT_SIGNOUT_EN}    ${ERROR_LANGUAGE}
