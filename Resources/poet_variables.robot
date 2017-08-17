*** Settings ***
Resource    poet_elements.robot

*** Variables ***
#Test Case Settings
${FIREFOX}                Firefox
${CHROME}                 chrome
${POET_URL}               http://systest.poet.freestyleiot.com/login
${SCREEN_X}               1920
${SCREEN_Y}               1080
${CENT_1920}              729

#Login Page
${TITLE}                  Poet | Freestyle Technologies
${USERNAME}               admin
${INVALID_ID}             adminadmin
${PASSWORD}               admin
${INVALID_PW}             123456
${TEST_LOCKED_ID}         locking
${TEST_LOCKED_PW}         locking
${LOCED_ID}               locked
${LOCED_PW}               locked

${ALERT_NO_USERNAME}      Username field is empty
${ALERT_NO_PASSWORD}      Password field is empty
${ALERT_NO_CREDENTIAL}    Please provide a username and password
${ALERT_INVALID_CREDENTIAL}     Invalid username and password.
${ALERT_ACC_LOCKED_1}     Account locked
${ALERT_ACC_LOCKED_2}     Account is locked


${TEXT_REMEMBER_ME}       Remember me
${TEXT_FORGOT}            Forgot your password?




#DashBoard
${TEXT_DASHBOARD}         DashBoard
${TEXT_DEFAULT}           Default


#Log Message
${ERROR_NOT_FOUND}        Element not found!
${ERROR_DEFAULT_VALUE}    Default value validation failed!



