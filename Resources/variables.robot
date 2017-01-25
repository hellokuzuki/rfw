*** Settings ***
Resource    elements.robot

*** Variables ***
#Browser
${BROWSER_FIREFOX}        Firefox
${BROWSER_CHROME}         chrome

#Delays
${COMMAND_DELAY}          1s
${SHORT_DELAY}            3s
${COMMAND_INTERVAL}       17m


#Log Prefix
${LOG_PREFIX}             ********

#FMS Credential
${USERNAME}               freestyle
${PASSWORD}               freestyle

#Report File
${OPT_FILE}            ${EMPTY}
# @{RECORD}              ${EMPTY}

${GCID}                 ${EMPTY}

#GATEWAY
${YL_GATEWAY}             99020000000026e2                          # Dev Gateway 1
${MC_GATEWAY}             99020000000026e3                          # Dev Gateway 2
${GATEWAY}                990200000000269b                          # Mark's testing gateway

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
