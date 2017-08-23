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

Validate Chinese Simplified Language of No Username And Password Message of Login Page
    [Documentation]    Chinese Simplified language with no user name and password.
    Fail    This Page was not implemented Yet.
    Click Button   ${BTN_SIGNIN}
    Wait Until Element Is Visible    ${ALERT_FIELD}
    Element Text Should Be    ${ALERT_FIELD}    ${TEXT_NO_CREDENTIAL_CN}

Validate Chinese Simplified Language of Missing Username Message of Login Page
    [Documentation]    Chinese Simplified language with no username.
    Fail    This Page was not implemented Yet.
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    Click Button   ${BTN_SIGNIN}
    Wait Until Element Is Visible    ${ALERT_FIELD}
    Element Text Should Be    ${ALERT_FIELD}    ${TEXT_NO_USERNAME_CN}

Validate Chinese Simplified Language of Missing Password Message of Login Page
    [Documentation]    Chinese Simplified language with no password.
    Fail    This Page was not implemented Yet.
    Input Text    ${INPUT_USERNAME}    ${USERNAME}
    Click Button   ${BTN_SIGNIN}
    Wait Until Element Is Visible    ${ALERT_FIELD}
    Element Text Should Be    ${ALERT_FIELD}    ${TEXT_NO_PASSWORD_CN}

Validate Chinese Simplified Language of Invalid Credential Message of Login Page
    [Documentation]    Chinese Simplified language with no password.
    Input Text    ${INPUT_USERNAME}    ${INVALID_ID}
    Input Text    ${INPUT_PASSWORD}    ${INVALID_PW}
    Click Button   ${BTN_SIGNIN}
    Wait Until Element Is Visible    ${ALERT_FIELD}
    Element Text Should Be    ${ALERT_FIELD}    ${TEXT_INVALID_CRED_CN}