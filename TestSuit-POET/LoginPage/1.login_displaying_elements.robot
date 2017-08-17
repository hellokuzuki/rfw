*** Settings ***
Resource    ../../Resources/poet_variables.robot
Resource    ../../Resources/poet_keywords.robot
Library     Selenium2Library    implicit_wait=3
Suite Setup    Run Test Suite Setup Process
Suite Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Validate Title Of Login Page
    [Documentation]    Title = Poet | Freestyle Technology
    Title Should Be    ${TITLE}

Validate Freestyle Logo Position
    [Documentation]    Freestyle Logo appears in upper left corner
    ${Hor}    Get Horizontal Position    ${LOC_LOGO}
    ${Ver}    Get Vertical Position    ${LOC_LOGO}
    Page Should Contain Element    ${LOC_LOGO}    ${ERROR_NOT_FOUND}
    Should Be True    ${Hor} < 100
    Should Be True    ${Ver} < 100

Validate Signin Entry Box Position
    [Documentation]    Sign in entry box is centred on Screen
    ${Center}    Get Horizontal Position    ${LOC_LOGIN_PANEL}
    Should Be True    ${Center} == ${CENT_1920}

Validate Username And Password Default Value
    [Documentation]    Username & Password entry boxes are empty
    ${user}    Get Value    ${INPUT_USERNAME}
    ${pass}    Get Value    ${INPUT_PASSWORD}
    Should Be Empty    ${user}
    Should Be Empty    ${pass}

Validate Remember Me Default Status
    [Documentation]    Remember me checkbox is empty
    Page Should Contain Checkbox    ${CHECK_REME}
    Checkbox Should Not Be Selected    ${CHECK_REME}

Validate Forgot Password Text
    [Documentation]    Forgot your password? Link is available
    Element Text Should Be    ${LOC_FORGOT}    ${TEXT_FORGOT}

Validate SignIn Button Visibility
    [Documentation]    SIGN IN button is available
    Element Should Be Visible    ${BTN_SIGNIN}

