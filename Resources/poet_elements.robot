*** Variables ***
#Login Page
${INPUT_USERNAME}         username
${INPUT_PASSWORD}         password
${BTN_SIGNIN}             submit
${CHECK_REME}             remember-me
${ALERT_LOGIN}            login-alert
${ALERT_FIELD}            xpath=//div[contains(@class, 'alert alert-danger')]
${LOC_REMEMBERME}         xpath=//div[contains(@class, 'form-group check-box')]/span
${LOC_FORGOT}             xpath=//div[contains(@class, 'form-group check-box')]/a
${LOC_LOGO}               xpath=//div[@class="login-bg-image"]/*[name()="svg" and @class="freestyle_logo_bar"]
${LOC_LOGIN_PANEL}        xpath=//div[@class="login-panel"]

#Dashboard
${PROFILE_DROPDOWN}       xpath=//div[contains(@class, 'btn-group')]
${SIGNOUT}                xpath=//div[contains(@class, 'dropdown-menu')]/*[text()='Sign out']
