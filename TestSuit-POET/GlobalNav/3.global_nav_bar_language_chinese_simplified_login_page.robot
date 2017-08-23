*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Global Nav Bar Chinese Simplified Language
    [Documentation]    The Poet Global Nav Bar Chinese Simplified
    Run Login Process
    Click Element    ${GLOBAL_NAV_BAR_LANG}
    Click Element    ${GLOBAL_NAV_BAR_LANG_CN}
    Click Element    ${PROFILE_DROPDOWN}
    Click Element    ${SIGNOUT}

Validate Chinese Simplified Language of Login Page
    [Documentation]    Chinese Simplified language check on login Page
    Element Text Should Be    ${LOC_LOGIN_STR}    ${TEXT_SIGNIN_CN}    ${ERROR_LANGUAGE}
    #Get Placeholder of user name password
    ${ph_user}    Get Element Attribute    ${PH_USERNAME}
    ${ph_pw}      Get Element Attribute    ${PH_PASSWORD}

    Should Be Equal As Strings    ${ph_user}    ${TEXT_USERNAME_CN}
    Should Be Equal As Strings    ${ph_pw}    ${TEXT_PASSWORD_CN}
    Element Text Should Be    ${LOC_REMEMBERME}    ${TEXT_REMEMBER_ME_CN}
    Element Text Should Be    ${LOC_FORGOT}    ${TEXT_FORGOT_CN}
    Element Text Should Be    ${BTN_SIGNIN}    ${TEXT_SIGNIN_CN}