from robot.libraries.BuiltIn import BuiltIn

from robot.api import logger

import json

class LoraLibrary():

    VERSION = 1.0

    def __init__(self, tp="yl"):
        self.tp = tp
        BuiltIn().log("Meter type is "+ self.tp, console="True")

    def show_type(self):
        BuiltIn().log("Meter type is "+ self.tp, console="True")

    def unicode_to_str(self, data_obj):
        str_data = data_obj.encode('utf-8')
        json_res = json.loads(str_data)
        return json_res

    def get_command_validator(self, state):
        if state is not None and state != "":
            state = str(state)
            if state.count("=") == 1:
                return state.rsplit('=', 1)[1]
            if state.count("=") > 1:
                return state.split(",")
        else:
            return None

    def print_response_data(self, response, *list):
        for element in list:
            BuiltIn().log( element + " in response = " + str(response[element]), console="True")

    def validate_command(self, data_obj, command, state=None):

        data = self.unicode_to_str(data_obj)

        state = self.get_command_validator(state)
        BuiltIn().log_to_console(state)

        if command == 'GET_METER_TYPE':
            status = self.validate_get_meter_type(data)
        elif command == 'GET_METER_SUMMATION_DELIVERED':
            status = self.validate_get_meter_summation_delivered(data)
        elif command == 'GET_METER_CURRENT_PRESSURE':
            status = self.validate_get_meter_current_pressure(data)
        elif command == 'GET_METER_GAS_VALVE_STATE':
            status = self.validate_get_meter_gas_valve_state(data, state)
        elif command == 'SET_METER_GAS_VALVE_STATE':
            status = self.validate_reponse_of_set_valve_command(data)
        elif command == 'GET_SUMMATION_REPORT_INTERVAL':
            status = self.validate_get_report_interval(data, state)
        elif command == 'SET_SUMMATION_REPORT_INTERVAL':
            status = self.validate_reponse_of_set_report_interval_command(data, state)
        elif command == 'GET_PRESSURE_REPORT_INTERVAL':
            status = self.validate_get_report_interval(data, state)
        elif command == 'SET_PRESSURE_REPORT_INTERVAL':
            status = self.validate_reponse_of_set_report_interval_command(data, state)
        elif command == 'GET_NIC_VERSION':
            status = self.validate_get_nic_version_command(data, state)
        elif command == 'GET_OFLOW_DETECT_ENABLE':
            status = self.validate_get_oflow_detect_enable(data, state)
        elif command == 'SET_OFLOW_DETECT_ENABLE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_OFLOW_DETECT_DURATION':
            status = self.validate_get_oflow_detect_duration(data, state)
        elif command == 'SET_OFLOW_DETECT_DURATION':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_OFLOW_DETECT_RATE':
            status = self.validate_get_oflow_detect_rate(data, state)
        elif command == 'SET_OFLOW_DETECT_RATE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_PRESSURE_ALARM_LEVEL_LOW':
            status = self.validate_get_pressure_alarm_level_low(data, state)
        elif command == 'SET_PRESSURE_ALARM_LEVEL_LOW':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_PRESSURE_ALARM_LEVEL_HIGH':
            status = self.validate_get_pressure_alarm_level_high(data, state)
        elif command == 'SET_PRESSURE_ALARM_LEVEL_HIGH':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_LEAK_DETECT_RANGE':
            status = self.validate_get_leak_detect_range(data, state)
        elif command == 'SET_LEAK_DETECT_RANGE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_MANUAL_RECOVER_ENABLE':
            status = self.validate_get_manual_recover_enable(data, state)
        elif command == 'SET_MANUAL_RECOVER_ENABLE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_METER_FIRMWARE_VERSION':
            status = self.validate_get_meter_firmware_version(data)
        elif command == 'GET_METER_SHUTOFF_CODES':
            status = self.validate_get_meter_shutoff_codes(data)
        elif command == 'GET_METER_SERIAL_NUMBER':
            status = self.validate_get_meter_serial_number(data, state)
        elif command == 'SET_METER_SERIAL_NUMBER':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_ELECTRIC_QNT_VALUE':
            status = self.validate_get_electric_qnt_value(data)
        elif command == 'GET_COMMS_MODE':   
            status = self.validate_get_comms_mode(data, state)
        elif command == 'SET_COMMS_MODE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_PILOT_LIGHT_MODE':
            status = self.validate_get_pilot_light_mode_command(data, state)
        elif command == 'SET_PILOT_LIGHT_MODE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_EARTHQUAKE_SENSOR_STATE':
            status = self.validate_get_earthquake_sensor_state(data, state)
        elif command == 'SET_EARTHQUAKE_SENSOR_STATE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_METER_READING_VALUE':
            status = self.validate_get_meter_reading_value_command(data, state)
        elif command == 'SET_METER_READING_VALUE':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_METER_STATUS':
            status = self.validate_get_meter_status_command(data)
        elif command == 'GET_METER_CUSTOMERID':
            status = self.validate_get_meter_customerid_command(data, state)
        elif command == 'SET_METER_CUSTOMERID':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_METER_TIME':
            status = self.validate_get_meter_time_command(data, state)
        elif command == 'SET_METER_TIME':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'SET_CONFIG_CENTER_SHUTDOWN':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'SET_CONFIG_DISABLE_CENTER_SHUTDOWN':
            status = self.validate_reponse_of_set_command(data)
        elif command == 'GET_PROTOCOL_VERSION':
            status = self.validate_get_protocol_version_command(data)
        elif command == 'GET_NIC_TIME':
            status = self.validate_get_nic_time_command(data)
        elif command == 'GET_NIC_SCHEDULE':
            status = self.validate_get_nic_schedule_command(data, state)
        elif command == 'SET_NIC_SCHEDULE':
            status = self.validate_reponse_of_set_command(data)
        else:
            BuiltIn().log_to_console("Command was not supported.")
        return status

    def validate_get_meter_type(self,response):
        elements = {"result_code", "manufacturer", "model_id"}
        self.print_response_data(response, *elements)
        
        if (
                'result_code' not in response or
                'manufacturer' not in response or
                'model_id' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif (
                self.tp == "yl" and
                response['result_code'] == 0 and
                response['manufacturer'] == 'YungLoong' and
                response['model_id'] == 0
            ):
            BuiltIn().log("Yung Loong Get Meter Type validate successful.", "INFO")
            return True
        elif (
                self.tp == "micom" and
                response['result_code'] == 0 and
                response['manufacturer'] == 'Micom' and
                response['model_id'] < 100
            ):
            BuiltIn().log("Micom Get Meter Type validate successful.", "INFO")
            return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_summation_delivered(self, response):
        elements = {"result_code", "summation_delivered", "timestamp"}
        self.print_response_data(response, *elements)

        if (
                'result_code' not in response or
                'summation_delivered' not in response or
                'timestamp' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif (
                response['result_code'] < 10 and
                len(str(response['timestamp'])) == 10
            ):
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
            return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_current_pressure(self, response):

        elements = {"result_code", "current_pressure", "timestamp"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'current_pressure' not in response or
                'timestamp' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif (
                response['result_code'] < 10 and
                len(str(response['timestamp'])) == 10 and
                response['current_pressure'] < 65535
            ):
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
            return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_gas_valve_state(self, response, state):
        
        elements = {"result_code", "valve_state"}
        self.print_response_data(response, *elements)
        
        if  (
                'result_code' not in response or
                'valve_state' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if state is None:
                BuiltIn().log("Valve stats was not validated.", "INFO")
                return True
            elif self.tp == "yl" and int(state) == 1 and response['valve_state'] != 1:
                BuiltIn().log("Valve state should return 1, But 0 has been returned!", "ERROR")
                return False
            elif self.tp == "yl" and int(state) == 0 and response['valve_state'] != 0:
                BuiltIn().log("Valve state should return 0, But 1 has been returned!", "ERROR")
                return False
            elif response['valve_state'] > 1:
                BuiltIn().log("Valve state greater than 1!", "ERROR")
                return False
            elif response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif self.tp == "micom":
                BuiltIn().log("Micom Meter require manual operation to open the valve, therefore unable to validate valve state.", "WARN")
                return True
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_reponse_of_set_valve_command(self, response):

        elements = {"result_code"}
        self.print_response_data(response, *elements)

        if 'result_code' not in response:
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 0:
                BuiltIn().log("Valve stats has been set correctly.", "INFO")
                return True
            elif response['result_code'] == 1:
                BuiltIn().log("MP_STATUS_FAILURE has been returned.", "INFO")
                return True
            elif response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            else:
                BuiltIn().log("Unknown result code has been returned.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_report_interval(self, response, state):

        elements = {"result_code","report_interval_mins"}
        self.print_response_data(response, *elements)
        
        if  (
                'result_code' not in response or
                'report_interval_mins' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("report_interval was not validated.", "INFO")
                return True
            elif int(state) > 65535 or int(state) < 5:
                BuiltIn().log("Validator parameter is incorrect!", "ERROR")
                return False
            elif int(response['report_interval_mins']) > 65535 or int(response['report_interval_mins']) < 5:
                BuiltIn().log("Incorrect report interval mins has been returned!", "ERROR")
                return False
            elif int(response['report_interval_mins']) == int(state):
                BuiltIn().log("Validation Successful!", "INFO")
                return True
            elif int(response['report_interval_mins']) != int(state):
                BuiltIn().log("Validation Failed! report_interval_mins != state", "ERROR")
                return False
            else:
                BuiltIn().log("Unexpected status happened.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_reponse_of_set_report_interval_command(self, response, state):

        elements = {"result_code","error_details"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'error_details' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if int(state) < 5 or int(state) > 65535:
                if response['result_code'] == 4:
                    BuiltIn().log("Result_code = 4,  MP_STATUS_MALFORMED_COMMAND ", "INFO")
                    return True
                else:
                    BuiltIn().log("Incorrect response has been returned", "ERROR")
                    return False
            elif 5 < int(state) < 65535:
                if response['result_code'] == 0:
                    BuiltIn().log("Result_code = 0,  MP_STATUS_SUCCESS_COMMAND ", "INFO")
                    return True
                else:
                    BuiltIn().log("Incorrect response has been returned", "ERROR")
                    return False
            else:
                BuiltIn().log("Unknown result code has been returned.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_nic_version_command(self, response, state):

        elements = {"result_code","nic_application_version", "nic_bootloader_version"}
        self.print_response_data(response, *elements)

        app_version = str(response['nic_application_version'])[:-1]
        boot_version = str(response['nic_bootloader_version'])[:-1]

        if  (
                'result_code' not in response or
                'nic_application_version' not in response or
                'nic_bootloader_version' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("Meter Version was not validated.", "INFO")
                return True
            elif str(state) !=  app_version: #str(response['nic_application_version']):
                BuiltIn().log("Incorrect nic_application_version was returned", "ERROR")
                return False
            elif str(state) != boot_version: #str(response['nic_bootloader_version']):
                BuiltIn().log("Incorrect nic_bootloader_version was returned", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_oflow_detect_enable(self, response, state):

        elements = {"result_code","overflow_detect_enable"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'overflow_detect_enable' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("overflow_detect_enable stats was not validated.", "INFO")
                return True
            elif int(state) == 1 and response['overflow_detect_enable'] != 1:
                BuiltIn().log("overflow_detect_enable state should return 1, But 0 has been returned!", "ERROR")
                return False
            elif int(state) == 0 and response['overflow_detect_enable'] != 0:
                BuiltIn().log("overflow_detect_enable state should return 0, But 1 has been returned!", "ERROR")
                return False
            elif int(response['overflow_detect_enable']) > 1:
                BuiltIn().log("overflow_detect_enable state greater than 1!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_oflow_detect_duration(self, response, state):

        elements = {"result_code","overflow_detect_duration"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'overflow_detect_duration' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("overflow_detect_duration was not validated.", "INFO")
                return True
            elif int(state) < 5:
                if response['overflow_detect_duration'] != 5:
                    BuiltIn().log("overflow_detect_duration should return minimum value(5)!", "ERROR")
                    return False
                else:
                    BuiltIn().log("Validation Successful.", "INFO")
                    return True 
            elif int(state) > 999:
                state = str(state)[:3]
                print int(state)
                print int(response['overflow_detect_duration'])

                if int(response['overflow_detect_duration']) != int(state):
                    BuiltIn().log("overflow_detect_duration should return the first digits when durantion is more than 999", "ERROR")
                    return False
                else:
                    BuiltIn().log("Validation Successful.", "INFO")
                    return True 
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_oflow_detect_rate(self, response, state):

        elements = {"result_code","overflow_detect_flowrate"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'overflow_detect_flowrate' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("overflow_detect_duration was not validated.", "INFO")
                return True
            elif int(state) < 13:
                if response['overflow_detect_flowrate'] != 13:
                    BuiltIn().log("overflow_detect_flowrate should return minimum value(13)!", "ERROR")
                    return False
                else:
                    BuiltIn().log("Validation Successful.", "INFO")
                    return True 
            elif int(state) > 40:
                if int(response['overflow_detect_flowrate']) != 40:
                    BuiltIn().log("overflow_detect_flowrate should return the maximum rate(40)", "ERROR")
                    return False
                else:
                    BuiltIn().log("Validation Successful.", "INFO")
                    return True 
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_pressure_alarm_level_low(self, response, state):

        elements = {"result_code","pressure_alarm_level_low"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'pressure_alarm_level_low' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("pressure_alarm_level_low was not validated.", "INFO")
                return True
            elif int(state) > 5:
                if response['pressure_alarm_level_low'] != 5:
                    BuiltIn().log("pressure_alarm_level_low should return maximum value(5)!", "ERROR")
                    return False
            elif int(response['pressure_alarm_level_low']) == int(state):
                BuiltIn().log("Validation Successful.", "INFO")
                return True 
            else:
                BuiltIn().log("Unexpected condition!.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_pressure_alarm_level_high(self, response, state):

        elements = {"result_code","pressure_alarm_level_high"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'pressure_alarm_level_high' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("pressure_alarm_level_high was not validated.", "INFO")
                return True
            elif int(state) > 5:
                if response['pressure_alarm_level_high'] != 5:
                    BuiltIn().log("pressure_alarm_level_high should return maximum value(5)!", "ERROR")
                    return False
            elif int(response['pressure_alarm_level_high']) == int(state):
                BuiltIn().log("Validation Successful.", "INFO")
                return True 
            else:
                BuiltIn().log("Unexpected condition!.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_leak_detect_range(self, response, state):

        elements = {"result_code","leak_detect_range"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'leak_detect_range' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("leak_detect_range was not validated.", "INFO")
                return True
            elif int(state) > 9:
                if response['leak_detect_range'] != 9:
                    BuiltIn().log("leak_detect_range should return maximum value(9)!", "ERROR")
                    return False
            elif int(response['leak_detect_range']) == int(state):
                BuiltIn().log("Validation Successful.", "INFO")
                return True 
            else:
                BuiltIn().log("Unexpected condition!.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_manual_recover_enable(self, response, state):
        
        elements = {"result_code","manual_recover_enable"}
        self.print_response_data(response, *elements)
        
        if  (
                'result_code' not in response or
                'manual_recover_enable' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("manual_recover_enable stats was not validated.", "INFO")
                return True
            elif int(state) == 1 and response['manual_recover_enable'] != 1:
                BuiltIn().log("Manual recover state should return 1, But 0 has been returned!", "ERROR")
                return False
            elif int(state) == 0 and response['manual_recover_enable'] != 0:
                BuiltIn().log("Maunal recover state should return 0, But 1 has been returned!", "ERROR")
                return False
            elif response['manual_recover_enable'] > 1:
                BuiltIn().log("Manual recover state greater than 1!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_firmware_version(self, response):

        elements = {"result_code","version"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'version' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            if response['result_code'] == 8:
                BuiltIn().log("Result_code = 8, Unknon Meter State has been returned!", "WARN")
                return True
            elif len(str(response['version'])) < 5:
                BuiltIn().log("Incorrect version has been returned!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_shutoff_codes(self, response):

        elements = {"result_code","shutoff_codes"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'shutoff_codes' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif len(str(response['shutoff_codes'])) < 5:
                BuiltIn().log("Incorrect version has been returned!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_serial_number(self, response, state):

        elements = {"result_code","meter_serial_number"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'meter_serial_number' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("meter_serial_number stats was not validated.", "INFO")
                return True
            elif str(response['meter_serial_number']) != str(state):
                BuiltIn().log("Incorrect meter_serial_number has been returned!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_electric_qnt_value(self, response):

        elements = {"result_code","electric_quantity_value"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'electric_quantity_value' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif int(response['electric_quantity_value']) <= 0 :
                BuiltIn().log("Incorrect electric_quantity_value has been returned!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_comms_mode(self, response, state):

        elements = {"result_code","meter_comms_mode"}
        self.print_response_data(response, *elements)
        
        if  (
                'result_code' not in response or
                'meter_comms_mode' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if state is None:
                BuiltIn().log("meter_comms_mode stats was not validated.", "INFO")
                return True
            elif int(state) == 1 and response['meter_comms_mode'] != 1:
                BuiltIn().log("meter_comms_mode state should return 1, But 0 has been returned!", "ERROR")
                return False
            elif int(state) == 0 and response['meter_comms_mode'] != 0:
                BuiltIn().log("meter_comms_mode state should return 0, But 1 has been returned!", "ERROR")
                return False
            elif response['meter_comms_mode'] > 1:
                BuiltIn().log("meter_comms_mode state greater than 1!", "ERROR")
                return False
            elif response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_earthquake_sensor_state(self, response, state):

        elements = {"result_code","earthquake_sensor_state"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'earthquake_sensor_state' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("earthquake_sensor_state stats was not validated.", "INFO")
                return True
            elif int(state) == 1 and response['earthquake_sensor_state'] != 0:
                BuiltIn().log("earthquake_sensor_state state should return 0, But 1 has been returned!", "ERROR")
                return False
            elif int(state) == 0 and response['earthquake_sensor_state'] != 1:
                BuiltIn().log("earthquake_sensor_state state should return 1, But 0 has been returned!", "ERROR")
                return False
            elif int(response['earthquake_sensor_state']) > 1:
                BuiltIn().log("earthquake_sensor_state state greater than 1!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_pilot_light_mode_command(self, response, state):

        state_para_1 = state[0].rsplit('=',1)[1]
        state_para_2 = state[1].rsplit('=',1)[1]
        state_para_3 = state[2].rsplit('=',1)[1]

        print 'state_para_1 = ' + str(state_para_1)
        print 'state_para_2 = ' + str(state_para_2)
        print 'state_para_3 = ' + str(state_para_3) 

        elements = {"result_code","pilot_light_mode", "pilot_flow_min", "pilot_flow_max"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'pilot_light_mode' not in response or
                'pilot_flow_min' not in response or
                'pilot_flow_max' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif response['result_code'] == 8:
                BuiltIn().log("Result_code = 8, Unknon Meter State has been returned!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("pilot_light_mode stats was not validated.", "INFO")
                return True
            elif int(state_para_1) != response['pilot_light_mode']:
                BuiltIn().log("Incorrect pilot_light_mode value has been returned!", "ERROR")
                return False
            elif int(state_para_2) != response['pilot_flow_min']:
                BuiltIn().log("Incorrect pilot_flow_min value has been returned!", "ERROR")
                return False
            elif int(state_para_3) != response['pilot_flow_max']:
                BuiltIn().log("Incorrect pilot_flow_max value has been returned!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_reading_value_command(self, response, state):

        elements = {"result_code","reading_value"}
        self.print_response_data(response, *elements)
        
        if  (
                'result_code' not in response or
                'reading_value' not in response or
                'timestamp' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("reading_value was not validated.", "INFO")
                return True
            elif int(response['reading_value']) == int(state):
                BuiltIn().log("Validation Successful!", "INFO")
                return True
            elif int(response['reading_value']) != int(state):
                BuiltIn().log("Validation Failed! reading_value != state", "ERROR")
                return False
            else:
                BuiltIn().log("Unexpected status happened.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_reponse_of_set_command(self, response):

        elements = {"result_code"}
        self.print_response_data(response, *elements)

        if 'result_code' not in response:
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif response['result_code'] == 0:
                BuiltIn().log("Set Command been set correctly.", "INFO")
                return True
            elif response['result_code'] == 1:
                BuiltIn().log("MP_STATUS_FAILURE has been returned.", "INFO")
                return True
            else:
                BuiltIn().log("Unknow result code has been returned.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_status_command(self, response):

        elements = {"result_code", "status"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'status' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif response['status'] is not None:
                BuiltIn().log("Meter Status has been verified.", "INFO")
                return True
            elif str(response['status']) == "":
                BuiltIn().log("Empty status was returned", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
        return False

    def validate_get_meter_customerid_command(self, response, state):

        elements = {"result_code", "customer_id"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'customer_id' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("customer_id was not validated.", "INFO")
                return True
            elif len(str(response['customer_id'])) != 14:
                BuiltIn().log("customer_id data format was incorrect.", "ERROR")
                return False
            elif int(response['customer_id']) == int(state):
                BuiltIn().log("Validation Successful!", "INFO")
                return True
            elif int(response['customer_id']) != int(state):
                BuiltIn().log("Validation Failed! customer_id != state", "ERROR")
                return False
            else:
                BuiltIn().log("Unexpected status happened.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_meter_time_command(self, response, state):

        elements = {"result_code", "time"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'time' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("time was not validated.", "INFO")
                return True
            elif int(response['time']) > int(state):
                BuiltIn().log("Validation Successful!", "INFO")
                return True
            elif int(response['time']) <= int(state):
                BuiltIn().log("Validation Failed! response time less than issued time", "ERROR")
                return False
            else:
                BuiltIn().log("Unexpected status happened.", "WARN")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_protocol_version_command(self, response):

        elements = {"result_code", "protocol_version"}
        self.print_response_data(response, *elements)
        
        if  (
                'result_code' not in response or
                'protocol_version' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif response['protocol_version'] is not None:
                BuiltIn().log("Meter protocal version has been verified.", "INFO")
                return True
            elif str(response['status']) == "":
                BuiltIn().log("Empty protocol_version was returned", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
        return False

    def validate_get_nic_time_command(self, response):

        elements = {"result_code", "nic_time"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'nic_time' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif len(str(response['nic_time'])) == 10:
                BuiltIn().log("Validation Successful!", "INFO")
                return True
            else:
                BuiltIn().log("Unexpected status happened.", "WARN")
                return False
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False

    def validate_get_nic_schedule_command(self, response, state):

        state_para_1 = state[0].rsplit('=',1)[1]
        state_para_2 = state[1].rsplit('=',1)[1]
        state_para_3 = state[2].rsplit('=',1)[1]
        state_para_4 = state[3].rsplit('=',1)[1]

        print 'state_para_1 = ' + str(state_para_1)
        print 'state_para_2 = ' + str(state_para_2)
        print 'state_para_3 = ' + str(state_para_3) 

        elements = {"result_code","day_mask", "active_period_start_time", "active_period_end_time", "modes"}
        self.print_response_data(response, *elements)

        if  (
                'result_code' not in response or
                'day_mask' not in response or
                'active_period_start_time' not in response or
                'active_period_end_time' not in response or
                'modes' not in response
            ):
            BuiltIn().log("Response does not contain correct parameters!", "ERROR")
            return False
        elif response['result_code'] < 10:
            if response['result_code'] == 7:
                BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
                return True
            elif response['result_code'] == 8:
                BuiltIn().log("Result_code = 8, Unknon Meter State has been returned!", "WARN")
                return True
            elif state is None:
                BuiltIn().log("pilot_light_mode stats was not validated.", "INFO")
                return True
            elif int(state_para_1) != response['day_mask']:
                BuiltIn().log("Incorrect day_mask value has been returned!", "ERROR")
                return False
            elif int(state_para_2) != response['active_period_start_time']:
                BuiltIn().log("Incorrect active_period_start_time value has been returned!", "ERROR")
                return False
            elif int(state_para_3) != response['active_period_end_time']:
                BuiltIn().log("Incorrect active_period_end_time value has been returned!", "ERROR")
                return False
            elif int(state_para_4) != response['modes']:
                BuiltIn().log("Incorrect modes value has been returned!", "ERROR")
                return False
            else:
                BuiltIn().log("Validation Successful.", "INFO")
                return True
        else:
            BuiltIn().log("Response contains incorrect value!", "ERROR")
            return False