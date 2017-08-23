*** Variables ***
#Login Page
${INPUT_USERNAME}         xpath=//*[@id="username"]
${INPUT_PASSWORD}         xpath=//*[@id="password"]
${BTN_SIGNIN}             submit
${CHECK_REME}             remember-me
${ALERT_LOGIN}            login-alert
${ALERT_FIELD}            xpath=//*[@id="login-alert"]
#xpath=//div[contains(@class, 'alert alert-danger')]

${LOC_REMEMBERME}         xpath=//div[contains(@class, 'form-group check-box')]/span
${LOC_FORGOT}             xpath=//div[contains(@class, 'form-group check-box')]/a
${LOC_LOGO}               xpath=//div[@class="login-bg-image"]/*[name()="svg" and @class="freestyle_logo_bar"]
${LOC_LOGIN_PANEL}        xpath=//div[@class="login-panel"]
${LOC_LOGIN_STR}          xpath=//div[@class="login-panel"]/h4
${PH_USERNAME}            username@placeholder
${PH_PASSWORD}            password@placeholder

#Dashboard
${GLOBAL_NAV_BAR}         xpath=//div[@class="clearfix"]
${PROFILE_DROPDOWN}       xpath=//div[contains(@class, 'btn-group')]
# ${SIGNOUT}                xpath=//div[contains(@class, 'dropdown-menu')]/*[text()='Sign out']
${SIGNOUT}                xpath=//*[@id="user-settings"]/div/div/a[5]

#Dashboard - Side Bar
${SIDE_BAR_DASHBOARD}     xpath=//div[@id="headingOne"]//span
${SIDE_BAR_DEFAULT}       xpath=//*[@id="collapseOne"]/div/ul/li/a
${SIDE_BAR_ALERTS}        xpath=//div[@id="headingTwo"]//span
${SIDE_BAR_UNRESOLVED}    xpath=//*[@id="collapseTwo"]/div/ul/li[1]/a
${SIDE_BAR_RESOLVED}      xpath=//*[@id="collapseTwo"]/div/ul/li[2]/a
${SIDE_BAR_VIEW_ALL}      xpath=//*[@id="collapseTwo"]/div/ul/li[3]/a

#Global Nav Bar
${GLOBAL_NAV_BAR_BELL}    notifications
${GLOBAL_NAV_BAR_LANG}    dropbtn
${GLOBAL_NAV_BAR_LANG_OPEN}    xpath=//div[contains(@class, 'dropdown-content')]
${GLOBAL_NAV_BAR_USER}    user-settings
# ${GLOBAL_NAV_BAR_AVATAR}   xpath=//span[@id="user-settings"]/avg[@class='user-ico']
${GLOBAL_NAV_BAR_USER_SELECTOR}    xpath=//span[@class='admin-text-grp']
${GLOBAL_NAV_BAR_USER_OPEN}    xpath=//div[contains(@class, 'ico-dropdown-menu')]

${GLOBAL_NAV_BAR_LANG_EN}    xpath=//div[@class="dropdown-content"]/a[1]
${GLOBAL_NAV_BAR_LANG_CN}    xpath=//div[@class="dropdown-content"]/a[2]
${GLOBAL_NAV_BAR_LANG_TW}    xpath=//div[@class="dropdown-content"]/a[3]
${GLOBAL_NAV_BAR_LANG_KR}    xpath=//div[@class="dropdown-content"]/a[4]
${GLOBAL_NAV_BAR_LANG_JP}    xpath=//div[@class="dropdown-content"]/a[5]

${GLOBAL_NAV_BAR_SETTING_PROFILE}    xpath=//*[@id="user-settings"]/div/div/a[1]
${GLOBAL_NAV_BAR_SETTING_EDIT}       xpath=//*[@id="user-settings"]/div/div/a[2]
${GLOBAL_NAV_BAR_SETTING_CHPW}       xpath=//*[@id="user-settings"]/div/div/a[3]
${GLOBAL_NAV_BAR_SETTING_HELP}       xpath=//*[@id="user-settings"]/div/div/a[4]
${GLOBAL_NAV_BAR_SETTING_LOGOUT}     xpath=//*[@id="user-settings"]/div/div/a[5]


#Tab Bar
${TAB_DEFUALT}    xpath=//div[@class="half-1"]//li[1]