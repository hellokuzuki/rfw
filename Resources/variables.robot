*** Settings ***
Resource    elements.robot

*** Variables ***

#Browser
${BROWSER_FIREFOX}        Firefox
${BROWSER_CHROME}         chrome

#Delays
${SHORT_DELAY}            3s
${COMMAND_INTERVAL}       17m
${COMMAND_DELAY}          1s

#Log Prefix
${LOG_PREFIX}             ********

#FMS information
${USERNAME}               freestyle
${PASSWORD}               freestyle

#Report File
${OPT_FILE}            ${EMPTY}
# @{RECORD}              ${EMPTY}

#FMS_URL
${FMS_URL}                http://lora-admin.dev.freestyleiot.com/       # Dev Envionment
#                         http://mwlora-admin.test.freestyleiot.com/   # Mark's Testing Envionment

#GATEWAY
${YL_GATEWAY}             99020000000026e2                          # Dev Gateway 1
${MC_GATEWAY}             99020000000026e3                          # Dev Gateway 2
${TEST_GATEWAY}           990200000000269b                          # Mark's testing gateway

@{YL_EIDS_ALL}    7ff9011020000077    7ff9011020000080    7ff9011020000082
...               7ff9011020000076    7ff9011020000075    7ff9011020000074
...               7ff9011020000063    7ff9011020000064    7ff9011020000065
...               7ff9011020000067    7ff9011020000068    7ff9011020000069
...               7ff9011020000071    7ff9011020000072    7ff9011020000073

#Exclude NICs which having problem
@{YL_EIDS}        7ff9011020000063    7ff9011020000077    7ff9011020000065
...               7ff9011020000067    7ff9011020000068    7ff9011020000069
...               7ff9011020000071    7ff9011020000072    7ff9011020000073
...               7ff9011020000080    7ff9011020000076

@{MC_EIDS}        7ff9011020000095    7ff9011020000096    7ff9011020000097
...               7ff9011020000098    7ff9011020000099    7ff9011020000100
...               7ff9011020000085    7ff9011020000086    7ff9011020000087
...               7ff9011020000088    7ff9011020000089    7ff9011020000090
...               7ff9011020000091    7ff9011020000093    7ff9011020000094

@{YL_GET_COMMAND}    GET_METER_SUMMATION_DELIVERED
...                  GET_METER_CURRENT_PRESSURE
...                  GET_METER_SUMMATION_DELIVERED
...                  GET_METER_GAS_VALVE_STATE
#...                 GET_METER_SUMMATION_SCHEDULE          # Release 2 will be available.
#...                 GET_METER_PRESSURE_SCHEDULE           # Release 2 will be available.
...                  GET_YL_OFLOW_DETECT_ENABLE
...                  GET_YL_OFLOW_DETECT_DURATION
...                  GET_YL_OFLOW_DETECT_RATE
...                  GET_YL_PRESSURE_ALARM_LEVEL_LOW
...                  GET_YL_PRESSURE_ALARM_LEVEL_HIGH
...                  GET_YL_LEAK_DETECT_RANGE
...                  GET_YL_MANUAL_RECOVER_ENABLE
# ...                GET_YL_FIRMWARE_VERSION                # Release 2 will be available.
# ...                GET_YL_METER_SHUTOFFCODES              # Release 2 will be available.
#...                 GET_METER_TYPE                         # Release 2 will be available.
# ...                GET_METER_VERSION                      # Release 2 will be available.
# ...                GET_METER_ELECTRIC_QUANTITY_VALUE      # Release 2 will be available.
# ...                GET_METER_COMMS_MODE                   # Release 2 will be available.
# ...                GET_METER_PILOT_LIGHT_MODE             # Release 2 will be available.
# ...                GET_METER_EARTHQUAKE_SENSOR_STATE      # Release 2 will be available.

@{YL_SET_COMMAND}    SET_METER_GAS_VALVE_STATE
...                  SET_YL_OFLOW_DETECT_ENABLE
...                  SET_YL_OFLOW_DETECT_DURATION
...                  SET_YL_OFLOW_DETECT_RATE
...                  SET_YL_PRESSURE_ALARM_LEVEL_LOW
...                  SET_YL_PRESSURE_ALARM_LEVEL_HIGH
...                  SET_YL_LEAK_DETECT_RANGE
...                  SET_YL_MANUAL_RECOVER_ENABLE
# ...                SET_METER_SUMMATION_SCHEDULE           # Release 2 will be available.
# ...                SET_METER_PRESSURE_SCHEDULE            # Release 2 will be available.
# ...                SET_METER_COMMS_MODE                   # Release 2 will be available.
# ...                SET_METER_SERIAL_NUMBER                # Release 2 will be available.
# ...                SET_METER_PILOT_LIGHT_MODE             # Release 2 will be available.
# ...                SET_METER_EARTHQUAKE_SENSOR_STATE      # Release 2 will be available.

@{MC_GET_COMMAND}    GET_METER_TYPE
...                  GET_METER_SUMMATION_DELIVERED
#...                 GET_METER_CURRENT_PRESSURE             # GET_METER_CURRENT_PRESSURE not support by the meter.
...                  GET_METER_GAS_VALVE_STATE
#...                 GET_METER_PRESSURE_SCHEDULE            # GET_METER_PRESSURE_SCHEDULE not support by the meter.
...                  GET_METER_SUMMATION_SCHEDULE
...                  GET_MC_METER_READING_VALUE
...                  GET_MC_METER_STATUS
#...                  GET_MC_METER_CUSTOMER_ID              # Release 2 will be available.
...                  GET_MC_METER_TIME

@{MC_SET_COMMAND}    SET_METER_GAS_VALVE_STATE
...                  SET_METER_SUMMATION_SCHEDULE
#...                 SET_METER_PRESSURE_SCHEDULE            # SET_METER_PRESSURE_SCHEDULE not support by the meter.
#...                 GET_METER_PILOTRANGE                   # GET_METER_PILOTRANGE not supported by the meter.
...                  SET_MC_METER_READING_VALUE
#...                 SET_MC_METER_STATUS                    # Release 2 will be available.
#...                 SET_MC_METER_CUSTOMER_ID               # Release 2 will be available.
...                  SET_MC_METER_TIME
...                  SET_MC_CONFIG_CENTER_SHUTDOWN
...                  SET_MC_CONFIG_DISABLE_CENTER_SHUTDOWN
