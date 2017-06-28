import os
import requests
import json
from robot.libraries.BuiltIn import BuiltIn
# from robot.api import logger
from openpyxl import load_workbook

CONST_SHEET_ENV         = 'enviornment'
CONST_FMS_URL           = 2
CONST_GATEWAY           = 3
CONST_DEVICE_TYPE       = 4
CONST_APP_BUNDLE_YL     = 5
CONST_APP_BUNDLE_YL     = 6
CONST_USER              = 7
CONST_PASSWORD          = 8
CONST_SESSION_ID        = 9

CONST_SHEET_DEVICE      = 'devices'

def load_xl(datafile, sheet):
    owd = os.getcwd()
    os.chdir('../Resources/testdata')
    global wb, ws
    wb = load_workbook(filename=datafile)
    ws = wb.get_sheet_by_name(sheet)
    os.chdir(owd)
    return wb, ws

def get_devices_by_header(datafile, header):
    wb, ws = load_xl(datafile, CONST_SHEET_DEVICE)
    devices = []
    for i in range(1, ws.max_column + 1):
        if header == ws.cell(row=1, column=i).value:
            for j in range(2, ws.max_row + 1):
                devices.append(str(ws.cell(row=j, column=i).value))
    return devices

def get_url_by_header(datafile, header):
    wb, ws = load_xl(datafile, CONST_SHEET_ENV)
    for i in range(1, ws.max_column + 1):
        if header == ws.cell(row=1, column=i).value:
            url = ws.cell(row=CONST_FMS_URL, column=i).value
    return url

def get_user_by_header(datafile, header):
    wb, ws = load_xl(datafile, CONST_SHEET_ENV)
    for i in range(1, ws.max_column + 1):
        if header == ws.cell(row=1, column=i).value:
            user = ws.cell(row=CONST_USER, column=i).value
    return user

def get_password_by_header(datafile, header):
    wb, ws = load_xl(datafile, CONST_SHEET_ENV)
    for i in range(1, ws.max_column + 1):
        if header == ws.cell(row=1, column=i).value:
            pwd = ws.cell(row=CONST_PASSWORD, column=i).value
    return pwd

def get_session_by_header(datafile, header):
    wb, ws = load_xl(datafile, CONST_SHEET_ENV)
    for i in range(1, ws.max_column + 1):
        if header == ws.cell(row=1, column=i).value:
            sessionid = ws.cell(row=CONST_SESSION_ID, column=i).value
    return sessionid

def set_session_by_header(datafile, header):
    wb, ws = load_xl(datafile, CONST_SHEET_ENV)
    urlRequest = get_url_by_header(datafile, header)
    username = get_user_by_header(datafile, header)
    password  = get_password_by_header(datafile, header)
    sessionid = get_session_by_header(datafile, header)

    userLoginRequest = urlRequest + '/login'
    dataValues       = {"username":username, "password":password}

    if len(sessionid) != 32:
        response         = requests.post(url=userLoginRequest,data=dataValues)
        jsonReply        = json.loads(response.text)
        retStatus        = jsonReply['response'].encode('utf-8')

        if retStatus == 'ok':
            retSessionID     = jsonReply['sessionid'].encode('utf-8')
            for i in range(1, ws.max_column + 1):
                if header == ws.cell(row=1, column=i).value:
                    ws.cell(row=CONST_SESSION_ID, column=i).value = retSessionID
                    wb.save(datafile)
                    return retSessionID
        else:
            return None
    else:
        checkLoginRequest = urlRequest + '/checklogin'
        dataValues        = {"sessionid":sessionid}
        response          = requests.post(url=checkLoginRequest,data=dataValues)
        jsonReply         = json.loads(response.text)
        retStatus         = jsonReply['response'].encode('utf-8')

        if retStatus == 'ok':
            return sessionid
        else:
            dataValues       = {"username":username, "password":password}
            response         = requests.post(url=userLoginRequest,data=dataValues)
            jsonReply        = json.loads(response.text)
            retStatus        = jsonReply['response'].encode('utf-8')
            if retStatus == 'ok':
                retSessionID     = jsonReply['sessionid'].encode('utf-8')
                for i in range(1, ws.max_column + 1):
                    if header == ws.cell(row=1, column=i).value:
                        ws.cell(row=CONST_SESSION_ID, column=i).value = retSessionID
                        wb.save(datafile)
                        return retSessionID
            else:
                return None

def get_commands_by_sheet(datafile, sheet):
    wb, ws = load_xl(datafile, sheet)
    commands = []
    for i in range(2, ws.max_row + 1):
        temp_list = []
        cmd = ws.cell(row=i, column=1).value
        par = ws.cell(row=i, column=2).value
        temp_list = [str(cmd), str(par)]
        commands.append(temp_list)
    return commands




# def get_environment(env):
        # BuiltIn().log_to_console("22222")
