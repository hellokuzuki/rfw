*** Settings ***
Resource    poet_elements.robot

*** Variables ***
#Test Case Settings
${FIREFOX}                Firefox
${CHROME}                 chrome
${POET_URL}               http://systest.poet.freestyleiot.com
# http://systest.poet.freestyleiot.com/login
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

#Languges
${TEXT_LANG_EN}           English
${TEXT_LANG_CN}           简体中文
${TEXT_LANG_TW}           中國傳統的
${TEXT_LANG_KR}           한국어
${TEXT_LANG_JP}           日本語

# CHinese (Simplified)
${TEXT_SIGNIN_CN}         登录
${TEXT_FORGOT_CN}         忘记密码了吗？
${TEXT_REMEMBER_ME_CN}    记住我
${TEXT_USERNAME_CN}       用户名
${TEXT_PASSWORD_CN}       密码
${TEXT_INVALID_CRED_CN}   用户名和密码无效。
${TEXT_ADMIN_CN}          管理员
${TEXT_MENU_CN}           菜单
${TEXT_SIGNOUT_CN}        注销
${TEXT_PROFILE_CN}        档案
${TEXT_DASHBOARD_CN}      仪表板
${TEXT_DEFAULT_CN}        默认
${TEXT_ALERT_CN}          警报
${TEXT_UNRESOLVED_CN}     未解决
${TEXT_RESOLVED_CN}       已解决
${TEXT_VIEWALL_CN}        查看全部
${TEXT_SETTING_CN}        设置
${TEXT_CHANGE_PW_CN}      更改密码
${TEXT_HELP_CN}           帮助

#English
${TEXT_SIGNIN_EN}         Sign in
${TEXT_SIGNIN_BTN_EN}     SIGN IN
${TEXT_FORGOT_EN}         Forgot your password?
${TEXT_REMEMBER_ME_EN}    Remember me
${TEXT_USERNAME_EN}       Username
${TEXT_PASSWORD_EN}       Password
${TEXT_INVALID_CRED_EN}   Invalid username and password.
${TEXT_ADMIN_EN}          Admin
${TEXT_MENU_EN}           Menu
${TEXT_SIGNOUT_EN}        Sign out
${TEXT_PROFILE_EN}        Profile
${TEXT_DASHBOARD_EN}      Dashboard
${TEXT_DEFAULT_EN}        Default
${TEXT_ALERT_EN}          Alerts
${TEXT_UNRESOLVED_EN}     Unresolved
${TEXT_RESOLVED_EN}       Resolved
${TEXT_VIEWALL_EN}        View all
${TEXT_SETTING_EN}        Settings
${TEXT_CHANGE_PW_EN}      Change password
${TEXT_HELP_EN}           Help


${TEXT_NO_CREDENTIAL_CN}     还没有定义
${TEXT_NO_USERNAME_CN}       还没有定义
${TEXT_NO_PASSWORD_CN}       还没有定义
${TEXT_NO_CREDENTIAL_EN}     Please provide a username and password
${TEXT_NO_USERNAME_EN}       Username field is empty
${TEXT_NO_PASSWORD_EN}       Password field is empty

#DashBoard
${TEXT_DASHBOARD}         DashBoard
${TEXT_DEFAULT}           Default


#Log Message
${ERROR_LANGUAGE}         Languge validation failed!
${ERROR_NOT_FOUND}        Element not found!
${ERROR_DEFAULT_VALUE}    Default value validation failed!




