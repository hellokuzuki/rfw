*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Global Nav Bar English Language
    [Documentation]    The Poet Global Nav Bar English
    Run Login Process
    Click Element    ${GLOBAL_NAV_BAR_LANG}
    Wait Until Element Is Visible    ${GLOBAL_NAV_BAR_LANG_OPEN}
    Click Element    ${GLOBAL_NAV_BAR_LANG_EN}

Validate English Language of Dashboard Page
    [Documentation]    English language on Dashboard Page
    #Side Bar
    Element Text Should Be    ${SIDE_BAR_DASHBOARD}    ${TEXT_DASHBOARD_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${SIDE_BAR_DEFAULT}    ${TEXT_DEFAULT_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${SIDE_BAR_ALERTS}    ${TEXT_ALERT_EN}    ${ERROR_LANGUAGE}

    Click Element    ${SIDE_BAR_ALERTS}
    Element Text Should Be    ${SIDE_BAR_UNRESOLVED}    ${TEXT_UNRESOLVED_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${SIDE_BAR_RESOLVED}    ${TEXT_RESOLVED_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${SIDE_BAR_VIEW_ALL}    ${TEXT_VIEWALL_EN}    ${ERROR_LANGUAGE}

    #Nav Bar
    Element Text Should Be    ${GLOBAL_NAV_BAR_LANG}    ${TEXT_LANG_EN}    ${ERROR_LANGUAGE}

    Click Element    ${PROFILE_DROPDOWN}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_PROFILE}    ${TEXT_PROFILE_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_EDIT}    ${TEXT_SETTING_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_CHPW}    ${TEXT_CHANGE_PW_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_HELP}    ${TEXT_HELP_EN}    ${ERROR_LANGUAGE}
    Element Text Should Be    ${GLOBAL_NAV_BAR_SETTING_LOGOUT}    ${TEXT_SIGNOUT_EN}    ${ERROR_LANGUAGE}

    #Tab Bar
    Element Text Should Be    ${TAB_DEFUALT}    ${TEXT_DEFAULT_EN}    ${ERROR_LANGUAGE}

Validate English Language of Alert Page
    [Documentation]    English language on Alert Page
    Fail    This Page was not implemented Yet.

Restore Environment
    [Documentation]    Set language back to English
    Click Element    ${GLOBAL_NAV_BAR_LANG}
    Sleep    2s
    # Wait Until Element Is Visible    ${GLOBAL_NAV_BAR_LANG_OPEN}
    Click Element    ${GLOBAL_NAV_BAR_LANG_EN}
    Sleep    2s
    Click Element    ${PROFILE_DROPDOWN}
    Sleep    2s
    # Wait Until Element Is Visible    ${GLOBAL_NAV_BAR_USER_OPEN}
    Click Element    ${SIGNOUT}


