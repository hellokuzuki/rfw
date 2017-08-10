*** Settings ***
Resource    poet_elements.robot

*** Variables ***
#Browser
${FIREFOX}                Firefox
${CHROME}                 chrome
${POET_URL}               http://poet-ui.10.10.10.214.xip.io/login

#Delays
${TITLE}                  Poet | Freestyle Technologies
${USERNAME}               poet
${PASSWORD}               Poetpoet

${ALERT_NO_USERNAME}      Username field is empty
${ALERT_NO_PASSWORD}      Password field is empty
${ALERT_NO_CREDENTIAL}    Please provide a username and password

${TEXT_REMEMBER_ME}       Remember me
${TEXT_FORGOT}            Forgot your password?



