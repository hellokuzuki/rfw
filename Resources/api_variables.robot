*** Variables ***
# Application Server Infomation
${AS_URL}               https://10.10.20.152:8080                # #https://10.10.20.152:8080
@{AS_DEV_EUIs}          000f161202000005    000f161202000006
...                     000f161202000100    000f161202000108    000f161202000166
...                     000f161202000086    000f161202000028    000f161202000153
...                     000f161202000036    000f161202000106    000f161202000116
${AS_APP_EUI}           8000000000000001
${AS_APP_KEY}           2b7e151628aed2a6abf7158809cf4f3c
${AS_NODE_NAME}         TEST Lab

#FMS
${FMS_URL}              http://10.10.20.152:83  #http://10.10.20.152:83
${GATEWAY_EID}          99020000000026e2
@{DEVICES_EID}          7ff9010202000005    7ff9010202000006
...                     7ff9010202000100    7ff9010202000108    7ff9010202000166
...                     7ff9010202000086    7ff9010202000028    7ff9010202000153
...                     7ff9010202000036    7ff9010202000106    7ff9010202000116
${DEVICE_TYPE}          GasMeter1
${APP_BUNDLE}           APL-LMT-YL01-1.0.16-STB
${USER}                 freestyle
${PASSWORD}             freestyle


${STARTTIME}            ${EMPTY}

${Retry_Interval}       30s
${Retry_Times}          60

${SessionID}            ${EMPTY}
${CID}                  ${EMPTY}
@{Devices}              ${EMPTY}
@{HolleyCMD}            ${EMPTY}





