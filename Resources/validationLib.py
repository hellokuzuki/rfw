import sys
import json
from robot.libraries.BuiltIn import BuiltIn

def validate_command(data_obj, command, state=None):
	data = unicode_to_str(data_obj)

	if state is not None and state != "":
		state = str(state)
		if '=' in state:
			state = state.rsplit('=', 1)[1]
	else:
		state = None

	BuiltIn().log_to_console(type(data_obj))
	BuiltIn().log_to_console(type(command))
	BuiltIn().log_to_console(type(state))
	BuiltIn().log_to_console(data_obj)
	BuiltIn().log_to_console(command)
	BuiltIn().log_to_console(state)

	if command == 'GET_METER_TYPE':
		status = validate_get_meter_type(data)
	elif command == 'GET_METER_SUMMATION_DELIVERED':
		status = validate_get_meter_summation_delivered(data)
	elif command == 'GET_METER_CURRENT_PRESSURE':
		status = validate_get_meter_current_pressure(data)
	elif command == 'GET_METER_GAS_VALVE_STATE':
		status = validate_get_meter_gas_valve_state(data, state)
	elif command == 'SET_METER_GAS_VALVE_STATE':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_SUMMATION_REPORT_INTERVAL':
		status = validate_get_report_interval(data, state)
	elif command == 'SET_SUMMATION_REPORT_INTERVAL':
		status = validate_reponse_of_set_report_interval_command(data, state)
	elif command == 'GET_PRESSURE_REPORT_INTERVAL':
		status = validate_get_report_interval(data, state)
	elif command == 'SET_PRESSURE_REPORT_INTERVAL':
		status = validate_reponse_of_set_report_interval_command(data, state)
	elif command == 'GET_METER_VERSION':
		status = validate_get_meter_version_command(data, state)
	elif command == 'GET_OFLOW_DETECT_ENABLE':
		status = validate_get_oflow_detect_enable(data, state)
	elif command == 'SET_OFLOW_DETECT_ENABLE':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_OFLOW_DETECT_DURATION':
		status = validate_get_oflow_detect_duration(data, state)
	elif command == 'SET_OFLOW_DETECT_DURATION':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_OFLOW_DETECT_RATE':
		status = validate_get_oflow_detect_rate(data, state)
	elif command == 'SET_OFLOW_DETECT_RATE':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_PRESSURE_ALARM_LEVEL_LOW':
		status = validate_get_pressure_alarm_level_low(data, state)
	elif command == 'SET_PRESSURE_ALARM_LEVEL_LOW':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_PRESSURE_ALARM_LEVEL_HIGH':
		status = validate_get_pressure_alarm_level_high(data, state)
	elif command == 'SET_PRESSURE_ALARM_LEVEL_HIGH':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_LEAK_DETECT_RANGE':
		status = validate_get_leak_detect_range(data, state)
	elif command == 'SET_LEAK_DETECT_RANGE':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_MANUAL_RECOVER_ENABLE':
		status = validate_get_manual_recover_enable(data, state)
	elif command == 'SET_MANUAL_RECOVER_ENABLE':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_METER_FIRMWARE_VERSION':
		status = validate_get_meter_firmware_version(data, state)
	elif command == 'GET_METER_SHUTOFF_CODES':
		status = validate_get_meter_shutoff_codes(data, state)
	elif command == 'GET_METER_SERIAL_NUMBER':
		status = validate_get_meter_serial_number(data, state)
	elif command == 'SET_METER_SERIAL_NUMBER':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_ELECTRIC_QNT_VALUE':
		status = validate_get_electric_qnt_value(data, state)
	elif command == 'GET_COMMS_MODE':	
		status = validate_get_comms_mode(data, state)
	elif command == 'SET_COMMS_MODE':
		status = validate_reponse_of_set_command(data)
	elif command == 'GET_PILOT_LIGHT_MODE':
		status = validate_get_comms_mode(data, state)
	elif command == 'SET_PILOT_LIGHT_MODE':
		status = validate_reponse_of_set_command(data)
	else:
		status = validate_get_meter_type(data)
	return status

def unicode_to_str(data_obj):
	str_data = data_obj.encode('utf-8')
	json_res = json.loads(str_data)
	return json_res

def validate_get_meter_type(response):

	print 'result_code = ' + str(response['result_code'])
	print 'manufacturer = ' + response['manufacturer']
	print 'model_id = ' + str(response['model_id'])
	
	if (
			'result_code' not in response or
			'manufacturer' not in response or
			'model_id' not in response
		):
		BuiltIn().log("Response does not contain correct parameters!", "ERROR")
		return False
	elif (
			response['result_code'] == 0 and
			response['manufacturer'] == 'YungLoong' and
			response['model_id'] == 0
		):
		BuiltIn().log("Yung Loong Get Meter Type validate successful.", "INFO")
		return True
	elif (
			response['result_code'] == 0 and
			response['manufacturer'] == 'Micom' and
			response['model_id'] < 100
		):
		BuiltIn().log("Micom Get Meter Type validate successful.", "INFO")
		return True
	else:
		BuiltIn().log("Response contains incorrect value!", "ERROR")
		return False

def validate_get_meter_summation_delivered(response):

	print 'result_code = ' + str(response['result_code'])
	print 'summation_delivered = ' + str(response['summation_delivered'])
	print 'timestamp = ' + str(response['timestamp'])

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

def validate_get_meter_current_pressure(response):

	print 'result_code = ' + str(response['result_code']) 
	print 'current_pressure = ' + str(response['current_pressure']) 
	print 'timestamp = ' + str(response['timestamp'])

	if 	(
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

def validate_get_meter_gas_valve_state(response, state):
	
	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'valve_state = ' + str(response['valve_state'])
	
	if 	(
			'result_code' not in response or
			'valve_state' not in response
		):
		BuiltIn().log("Response does not contain correct parameters!", "ERROR")
		return False
	elif response['result_code'] < 10:
		if response['result_code'] == 7:
			BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
			return True
		elif state is None:
			BuiltIn().log("Valve stats was not validated.", "INFO")
			return True
		elif int(state) == 1 and response['valve_state'] != 1:
			BuiltIn().log("Valve state should return 1, But 0 has been returned!", "ERROR")
			return False
		elif int(state) == 0 and response['valve_state'] != 0:
			BuiltIn().log("Valve state should return 0, But 1 has been returned!", "ERROR")
			return False
		elif response['valve_state'] > 1:
			BuiltIn().log("Valve state greater than 1!", "ERROR")
			return False
		else:
			BuiltIn().log("Validation Successful.", "INFO")
			return True
	else:
		BuiltIn().log("Response contains incorrect value!", "ERROR")
		return False

def validate_get_report_interval(response, state):

	print 'state = ' + str(state) 
	print 'result_code = ' + str(response['result_code'])
	print 'report_interval_mins = ' + str(response['report_interval_mins'])
	
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
			BuiltIn().log("Unexpected status happened.", "INFO")
			return True
	else:
		BuiltIn().log("Response contains incorrect value!", "ERROR")
		return False

def validate_reponse_of_set_report_interval_command(response, state):

	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'error_details = ' + str(response['error_details'])

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
			BuiltIn().log("Unknow result code has been returned.", "WARN")
			return True
	else:
		BuiltIn().log("Response contains incorrect value!", "ERROR")
		return False

def validate_get_meter_version_command(response, state):

	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'nic_application_version = ' + str(response['nic_application_version'])
	print 'nic_bootloader_version = ' + str(response['nic_bootloader_version'])

	state = state.replace('.', '')
	state = state.replace('-', '')
	response['nic_application_version'] = state.replace('.', '')
	response['nic_application_version'] = state.replace('-', '')
	response['nic_bootloader_version'] = state.replace('.', '')
	response['nic_bootloader_version'] = state.replace('-', '')

	if 	(
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
		elif str(state) != str(response['nic_application_version']):
			BuiltIn().log("Incorrect nic_application_version was returned", "ERROR")
			return False
		elif str(state) != str(response['nic_bootloader_version']):
			BuiltIn().log("Incorrect nic_bootloader_version was returned", "ERROR")
			return False
		else:
			BuiltIn().log("Validation Successful.", "INFO")
			return True
	else:
		BuiltIn().log("Response contains incorrect value!", "ERROR")
		return False


def validate_get_oflow_detect_enable(response, state):

	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'overflow_detect_enable = ' + str(response['overflow_detect_enable'])

	if 	(
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

def validate_get_oflow_detect_duration(response, state):

	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'overflow_detect_duration = ' + str(response['overflow_detect_duration'])

	if 	(
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

def validate_get_oflow_detect_rate(response, state):

	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'overflow_detect_flowrate = ' + str(response['overflow_detect_flowrate'])

	if 	(
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

def validate_get_pressure_alarm_level_low(response, state):

	print 'state = ' + str(state)
	print 'result_code = ' + str(response['result_code'])
	print 'pressure_alarm_level_low = ' + str(response['pressure_alarm_level_low'])

	if 	(
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
			elif response['pressure_alarm_level_low'] == int(state):
				BuiltIn().log("Validation Successful.", "INFO")
				return True	
		else:
			BuiltIn().log("Unexpected condition!.", "WARN")
			return True
	else:
		BuiltIn().log("Response contains incorrect value!", "ERROR")
		return False

def validate_reponse_of_set_command(response):
	print 'result_code = ' + str(response['result_code']) + '\n'
	if 'result_code' not in response:
		BuiltIn().log("Response does not contain correct parameters!", "ERROR")
		return False
	elif response['result_code'] < 10:
		if response['result_code'] == 7:
			BuiltIn().log("Result_code = 7, Meter not attached!", "WARN")
			return True
		elif response['result_code'] == 0:
			BuiltIn().log("Valve stats has been set correctly.", "INFO")
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

