*** Variables ***
#Device Management
${EXECUTE_BUTTON}         Execute
${SEND_BUTTON}            Send
${OK_BUTTON}              Ok
${CANCEL_BUTTON}          Cancel

${SIGNIN_BTN}             Sign in

#FMS Menu Tabs
${MAIN}                   ui-block-a
${LOGS}                   ui-block-e
${FIND_BTN}               pSearch pButton

#Logs
${LOGS_TABLE}             flexi-logs
${RFS_ICON}               pReload pButton

#Response status
${STATUS_REQ}                 Issued
${STATUS_RES}                 Responded from GW ${GATEWAY}

#Element Xpath Selector
# ${XPATH_MAINPAGE_GATEWAY}           xpath=//div[contains(text(), "${gateway_eid}")]
${XPATH_MENU_DEVICE_MANAGEMENT}     xpath=//li[contains(@class, "ui-block-a")]  #Device Management tab
${XPATH_MENU_LOGS}                  xpath=//li[contains(@class, "ui-block-e")]  #Logs tab

${XPATH_DEVICE_DEFAULT_EID}         xpath=//table[contains(@id, "flexi-devices")]//tr[contains(@id,"row0")]//td[1]
${XPATH_EXE_BTN}                    xpath=//span[contains(text(), "Execute")]

${XPATH_COMMAND_EID}                xpath=//div[contains(@id,"execute-popup")]//input[contains(@id, "eid")]
${XPATH_COMMAND_SEND}               xpath=//span[contains(text(), "Send")]
${XPATH_COMMAND_OK}                 xpath=//span[contains(text(), "Ok")]
${XPATH_COMMAND_CANCEL}             xpath=//*[@id="execute"]/form/div/a[2]/span/span

${XPATH_LOGS_FIND_BTN}              xpath=//div[contains(@class, "pSearch pButton")]
${XPATH_LOGS_REFRESH_BTN}           xpath=//div[contains(@class, "pReload pButton")]