*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Global Nav Bar Position On Dashboard Screen
    [Documentation]    The Poet Global Nav Bar Position on dashboard screen
    Run Login Process
    Page Should Contain Element    ${GLOBAL_NAV_BAR}    ${ERROR_NOT_FOUND}
    ${Ver}    Get Vertical Position    ${GLOBAL_NAV_BAR}
    Should Be True    ${Ver} < 100

Validate Global Nav Bar Position On Default Screen
    [Documentation]    The Poet Global Nav Bar Position on default screen
    Click Element    ${SIDE_BAR_DEFAULT}
    Page Should Contain Element    ${GLOBAL_NAV_BAR}    ${ERROR_NOT_FOUND}
    ${Ver}    Get Vertical Position    ${GLOBAL_NAV_BAR}
    Should Be True    ${Ver} < 100

Validate Global Nav Bar Position On Unresolved Screen
    [Documentation]    The Poet Global Nav Bar Position on unresolved screen
    Click Element    ${SIDE_BAR_ALERTS}
    Click Element    ${SIDE_BAR_UNRESOLVED}
    Page Should Contain Element    ${GLOBAL_NAV_BAR}    ${ERROR_NOT_FOUND}
    ${Ver}    Get Vertical Position    ${GLOBAL_NAV_BAR}
    Should Be True    ${Ver} < 100

Validate Global Nav Bar Position On Resolved Screen
    [Documentation]    The Poet Global Nav Bar Position on resolved screen
    Click Element    ${SIDE_BAR_RESOLVED}
    Page Should Contain Element    ${GLOBAL_NAV_BAR}    ${ERROR_NOT_FOUND}
    ${Ver}    Get Vertical Position    ${GLOBAL_NAV_BAR}
    Should Be True    ${Ver} < 100

Validate Global Nav Bar Position On View All Screen
    [Documentation]    The Poet Global Nav Bar Position on view all screen
    Click Element    ${SIDE_BAR_VIEW_ALL}
    Page Should Contain Element    ${GLOBAL_NAV_BAR}    ${ERROR_NOT_FOUND}
    ${Ver}    Get Vertical Position    ${GLOBAL_NAV_BAR}
    Should Be True    ${Ver} < 100

Validate Global Nav Bar Contains
    [Documentation]    The Poet Global Nav Bar contains on view all screen
    Click Element    ${SIDE_BAR_DASHBOARD}
    Click Element    ${SIDE_BAR_DEFAULT}
    Page Should Contain Element    ${GLOBAL_NAV_BAR_BELL}    ${ERROR_NOT_FOUND}
    Page Should Contain Element    ${GLOBAL_NAV_BAR_LANG}    ${ERROR_NOT_FOUND}
    Page Should Contain Element    ${GLOBAL_NAV_BAR_USER}    ${ERROR_NOT_FOUND}

