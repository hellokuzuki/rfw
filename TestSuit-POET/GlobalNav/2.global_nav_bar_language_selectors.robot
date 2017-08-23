*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Validate Global Nav Bar Language Selector Symbol
    [Documentation]    The Poet Global Nav Bar Languate Symbol
    Run Login Process
    Click Element    ${GLOBAL_NAV_BAR_LANG}
    Element Text Should Be    ${GLOBAL_NAV_BAR_LANG_EN}    ${TEXT_LANG_EN}
    Element Text Should Be    ${GLOBAL_NAV_BAR_LANG_CN}    ${TEXT_LANG_CN}
    Element Text Should Be    ${GLOBAL_NAV_BAR_LANG_TW}    ${TEXT_LANG_TW}
    Element Text Should Be    ${GLOBAL_NAV_BAR_LANG_KR}    ${TEXT_LANG_KR}
    Element Text Should Be    ${GLOBAL_NAV_BAR_LANG_JP}    ${TEXT_LANG_JP}
