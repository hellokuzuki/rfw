import requests
import datetime
import logging
import json
import os
import PYXL
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from openpyxl import load_workbook


class APILibrary():

    VERSION = 1.0

    g_testfile = None

    def __init__(self, testfile=None):
        global g_testfile
        g_testfile = testfile

    def getUTCTime(self):
        now = datetime.datetime.utcnow()
        return now

    def convertTime(self, time):
        return datetime.datetime.strptime(time,'%Y-%m-%dT%H:%M:%S.%fZ')

    def createSessionFile(self):
        os.chdir('../Resources')
        if not os.path.exists('cookie.txt'):
            file('cookie.txt','w').close

    def print_response_data(self, data, *list):
        for element in list:
            BuiltIn().log( element + " in response = " + str(data[element]), console="True")

    def check_response(self, res):
        if res is not None:
            BuiltIn().log(" **** Response validate Successful. ****", "INFO")
        else:
            BuiltIn().log(" **** Response validate Failed. ****", "ERROR")


    def get_by_header(self, sheet, header):
        # li = PYXL.get_devices_by_header(g_testfile, header)
        # BuiltIn().log_to_console(str(li))

        # url = PYXL.get_url_by_header(g_testfile, header)
        # BuiltIn().log_to_console(str(url))

        # user = PYXL.get_user_by_header(g_testfile, header)
        # BuiltIn().log_to_console(str(user))

        # pwd = PYXL.get_password_by_header(g_testfile, header)
        # BuiltIn().log_to_console(str(pwd))

        # session_new = PYXL.set_session_by_header(g_testfile, header)
        # BuiltIn().log_to_console(str(session_new))

        # commands = PYXL.get_commands_by_sheet(g_testfile, 'yl_command_test')
        # BuiltIn().log_to_console(str(commands))

        cid = self.deviceSendCommands(header,'yl_command_test', "7ff9010202000006")
        BuiltIn().log_to_console(str(cid))
        # for cmd in commands:
        #     cmd_name, cmd_para = str(cmd[0]), str(cmd[1])
        #     if cmd_para == "None":
        #         dataValues = {"eid":devEID, "name":cmd_name}
        #     else:
        #         dataValues = {"eid":devEID, "name":cmd_name}



    ########################################
    ###   1 User Login                   ###
    ########################################

    def userLogin(self, urlRequest,username,password):

        self.createSessionFile()

        # No session id in cookie file.
        if os.stat("cookie.txt").st_size == 0:

            userLoginRequest = urlRequest + '/login'
            dataValues       = {"username":username, "password":password}
            response         = requests.post(url=userLoginRequest,data=dataValues)
            jsonReply        = json.loads(response.text)
            retStatus        = jsonReply['response'].encode('utf-8')
            BuiltIn().log_to_console('\n')

            if retStatus == 'ok':
                f = open('cookie.txt', 'w')
                f.write(retSessionID)
                f.close()
                retSessionID     = jsonReply['sessionid'].encode('utf-8')
                BuiltIn().log_to_console(retSessionID)
                BuiltIn().log_to_console('*** Login Successful. ***')
                return retSessionID
            else:
                BuiltIn().log_to_console('*** Login Failed. ***')
                return None
        # ression id existing in cookie file.
        else:

            with open('cookie.txt', 'r') as myfile:
                sessionid = myfile.read().replace('\n', '')

            checkLoginRequest = urlRequest + '/checklogin'
            dataValues        = {"sessionid":sessionid}
            response          = requests.post(url=checkLoginRequest,data=dataValues)
            jsonReply         = json.loads(response.text)
            retStatus         = jsonReply['response'].encode('utf-8')
            
            # Old session id still valid.
            if retStatus == 'ok':
                retSessionID      = jsonReply['sessionid'].encode('utf-8')
                BuiltIn().log_to_console('*** Login Successful. ***')
                return retSessionID
            else:
                userLoginRequest = urlRequest + '/login'
                dataValues       = {"username":username, "password":password}
                response         = requests.post(url=userLoginRequest,data=dataValues)
                jsonReply        = json.loads(response.text)
                retStatus        = jsonReply['response'].encode('utf-8')

                if retStatus == 'ok':
                    retSessionID     = jsonReply['sessionid'].encode('utf-8')
                    f = open('cookie.txt', 'w')
                    f.write(retSessionID)
                    f.close()
                    BuiltIn().log_to_console(retSessionID)
                    BuiltIn().log_to_console('*** Login Successful. ***')
                    return retSessionID
                else:
                    BuiltIn().log_to_console('*** Login Failed. ***')
                    return None

    ########################################
    ###   2 Get All Online Devices       ###
    ########################################

    def getAllOnlineDevices(self, urlRequest, session):

        devices = []
        userLoginRequest = urlRequest + '/getDeviceInfo'
        dataValues       = {"sessionid":session}
        response         = requests.post(url=userLoginRequest,data=dataValues)
        jsonReply        = json.loads(response.text)

        for obj in range(0, len(jsonReply)):
            if jsonReply[obj]['status'] == 'Online':
                devices.append(jsonReply[obj]['eid'].encode('utf-8'))
        BuiltIn().log_to_console(devices)
        return devices

    def getDevices(self, urlRequest, session):

        devices = []
        userLoginRequest = urlRequest + '/getDeviceInfo'
        dataValues       = {"sessionid":session}
        response         = requests.post(url=userLoginRequest,data=dataValues)
        jsonReply        = json.loads(response.text)

        for obj in range(0, len(jsonReply)):
            if (
                jsonReply[obj]['status'] == 'Online' or
                jsonReply[obj]['status'] == "Offline" or 
                jsonReply[obj]['status'] == "Uncommissioned" or 
                jsonReply[obj]['status'] == "0" or 
                jsonReply[obj]['status'] is None
                ):
                devices.append(jsonReply[obj]['eid'].encode('utf-8'))
        
        BuiltIn().log_to_console("Available Devices = " + str(devices))
        return devices

    ########################################
    ###   3 Send Command To Device       ###
    ########################################

    def deviceSendCommand(self, urlRequest, session, Command, devEID, cmd_params=''):
        cookie = {"sessionid":session}
        requestAPI = urlRequest + '/DeviceSendCommand'

        if cmd_params:
            dataValues = {"eid":devEID, "name":Command}
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
        else:
            dataValues = {"eid":devEID, "name":Command}
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)

        jsonReply = json.loads(response.text)
        retStatus = jsonReply['response'].encode('utf-8')

        BuiltIn().log_to_console(jsonReply)

        if retStatus == 'ok':
            return jsonReply['cid']
        else:
            return None

    def deviceSendCommands(self, server, cmd_page, devEID):
        
        ## server:        Sheet[enviornment] -> "TEST LAB SERVER" or "TEST SERVER"
        #### urlRequest:    Sheet[enviornment] -> Row #2
        #### sessionid:     Sheet[enviornment] -> Row #9
        sessionid  = PYXL.set_session_by_header(g_testfile, server)
        urlRequest = PYXL.get_url_by_header(g_testfile, server)
        cookie = {"sessionid":sessionid}

        ## cmd_page:      Sheet[yl_command], Sheet[yl_command_test]
        commands   = PYXL.get_commands_by_sheet(g_testfile, cmd_page)

        requestAPI = urlRequest + '/DeviceSendCommand'

        cid = []
        for cmd in commands:
            cmd_name, cmd_para = str(cmd[0]), str(cmd[1])
            dataValues = {"eid":devEID, "name":cmd_name}
            if cmd_para != "None":
                if cmd_para.count("=") == 1:
                    para_name = cmd_para.rsplit('=', 1)[0]
                    para_value = cmd_para.rsplit('=', 1)[1]
                    dataValues.update({para_name:para_value})
                elif cmd_para.count("=") > 1:
                    for para in cmd_para.split(','):
                        para_name = para.rsplit('=', 1)[0]
                        para_value = para.rsplit('=', 1)[1]
                        dataValues.update({para_name:para_value})
                else:
                    pass
            else:
                pass
            BuiltIn().log_to_console(str(dataValues))
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')

            if retStatus == 'ok':
                cid.append(str(jsonReply['cid']))

        return cid

 

    ########################################
    ###   4 Get Transaction              ###
    ########################################

    def getTransaction(self, urlRequest, session, Command, devEID, cid):
        BuiltIn().log_to_console(cid)
        cookie = {"sessionid":session}
        requestAPI = urlRequest + '/getTransactions'
        dataValues = {"eid":devEID, "qtype":"cid,command,status", "query":str(cid) + "," + Command + "," + "Responded*"}
        response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)

        jsonReply = json.loads(response.text)

        BuiltIn().log_to_console(len(jsonReply['rows']))
        starttime = BuiltIn().get_variable_value("${STARTTIME}")

        if len(jsonReply['rows']) >= 1:
            for i in range(0, len(jsonReply['rows'])):
                if self.convertTime(jsonReply['rows'][i]['time'].encode('utf-8')) > starttime:
                    BuiltIn().log_to_console("start time = " + str(starttime) + " response time was " + jsonReply['rows'][i]['time'] )
                    return jsonReply['rows'][i]['data'].encode('utf-8')
                else:
                    BuiltIn().log_to_console("start time = " + str(starttime) + " response time was " + jsonReply['rows'][i]['time'] )
                    return None
        else:
            return None

    ########################################
    ###   5 Brocaar Application Server   ###

    ########################################
    def addNodesToAS(self, *dev_list):
        as_devices  = dev_list
        as_url      = BuiltIn().get_variable_value("${AS_URL}")
        app_eui     = BuiltIn().get_variable_value("${AS_APP_EUI}")
        app_key     = BuiltIn().get_variable_value("${AS_APP_KEY}")
        node_name   = BuiltIn().get_variable_value("${AS_NODE_NAME}")
        requestAPI  = as_url + '/api/node'
        headers     = {'Grpc-Metadata-Authorization': 'ghydOwk7fX9XVX+Ssm4Doif+RRC83NP5DVeX8jvh5J0=', 'Content-Type': 'application/json'}
        BuiltIn().log_to_console(" ")
        for i in range (0, len(as_devices)):
            if len(as_devices[i]) == 16:
                dataValues  = {
                      "devEUI": str(as_devices[i]),
                      "appEUI": str(app_eui),
                      "appKey": str(app_key),
                      "rxDelay": 0,
                      "rx1DROffset": 0,
                      "channelListID": "0",
                      "rxWindow": "RX1",
                      "rx2DR": 0,
                      "name": str(node_name) + " " + str(as_devices[i]),
                      "relaxFCnt": False
                }

                response = requests.post(url=requestAPI, data=json.dumps(dataValues), headers=headers, verify=False)
                BuiltIn().log_to_console(str(response.reason))
                if response.reason == "OK":
                    BuiltIn().log_to_console("Device " + str(as_devices[i]) + " has been added to Application Server.")
                else:
                    BuiltIn().log_to_console("Device " + str(as_devices[i]) + " failed to be added to Application Server.")
            else:
                BuiltIn().log_to_console("Length of Device EUI is incorrect:  " + str(as_devices[i]) + " failed to be added to Application Server.")

    def deleteNodesFromAS(self, *dev_list):
        as_devices  = dev_list
        as_url      = BuiltIn().get_variable_value("${AS_URL}")
        BuiltIn().log_to_console(" ")
        for i in range (0, len(as_devices)):
            if len(as_devices[i]) == 16:
                requestAPI  = as_url + '/api/node' + '/' + str(as_devices[i])
                response = requests.delete(url=requestAPI, verify=False)
                # BuiltIn().log_to_console("Delete Device " + str(as_devices[i]) + " -> " + str(response.reason))
                if response.reason == "OK":
                    BuiltIn().log_to_console("Device " + str(as_devices[i]) + " has been removed from Application Server.")
                else:
                    BuiltIn().log_to_console("Device " + str(as_devices[i]) + " failed to be removed from Application Server.")
            else:
                BuiltIn().log_to_console("Length of Device EUI is incorrect:  " + str(as_devices[i]) + " failed to be removed from Application Server.")

    ########################################
    ###   6 FMS   ###
    ########################################

    def fmsAddDevices(self, urlRequest, session, gw_eid, app_bundle, dev_type, *dev_eid):
        # cookie = {"sessionid":session}
        requestAPI = urlRequest + '/addDevice'
        fms_devices  = dev_eid

        avb_devices = self.getDevices(urlRequest, session)

        BuiltIn().log_to_console(" ")
        for i in range (0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] not in avb_devices:
                dataValues       = { 
                    "sessionid": session,
                    "eid": str(fms_devices[i]),
                    "gw_eid": str(gw_eid),
                    "device_type": str(dev_type),
                    "bundle_name": str(app_bundle)
                    }
                response         = requests.post(url=requestAPI, data=dataValues)
                jsonReply        = json.loads(response.text)
            else:
                BuiltIn().log_to_console("fmsAddDevices: " + fms_devices[i] + " Length of Device EUI is incorrect OR Device already existing!")

    def fmsActivateDevices(self, urlRequest, session, gw_eid, *dev_eid):
        requestAPI  = urlRequest + '/gatewayActivateDevice'
        fms_devices = dev_eid
        avb_devices = self.getDevices(urlRequest, session)

        BuiltIn().log_to_console(" ")
        for i in range (0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues       = { 
                    "sessionid": session,
                    "eid": str(fms_devices[i]),
                    "gw_eid": str(gw_eid)
                    }
                response         = requests.post(url=requestAPI, data=dataValues)
                jsonReply        = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console("fmsActivateDevices: " + fms_devices[i] + " Length of Device EUI is incorrect AND Device to be activated is not existing!")

    def fmsDeviceRemoveApp(self, urlRequest, session, *dev_eid):
        requestAPI  = urlRequest + '/deviceRemoveApp'
        fms_devices = dev_eid
        avb_devices = self.getDevices(urlRequest, session)

        BuiltIn().log_to_console(" ")
        for i in range (0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues       = { 
                    "sessionid": session,
                    "eid": str(fms_devices[i])
                    }
                response         = requests.post(url=requestAPI, data=dataValues)
                jsonReply        = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console("fmsDeviceRemoveApp: Length of Device EUI is incorrect AND Device to be removed is not existing!")

    def fmsDeviceUpdateApp(self, urlRequest, session, *dev_eid):
        requestAPI = urlRequest + '/setDevice'
        fms_devices = dev_eid


    def fmsRemoveDevices(self, urlRequest, session, *dev_eid):
        requestAPI_setDevice     = urlRequest + '/setDevice'
        requestAPI_removeDevice  = urlRequest + '/removeDevice'
        fms_devices = dev_eid

        avb_devices = self.getDevices(urlRequest, session)
        BuiltIn().log_to_console(" ")
        for i in range (0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues_setDevice       = { 
                    "sessionid": session,
                    "edit_eid": str(fms_devices[i]),
                    "gw_eid": 0
                    }
                response         = requests.post(url=requestAPI_setDevice, data=dataValues_setDevice)
                jsonReply        = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console("fmsRemoveDevices(1st Step): Length of Device EUI is incorrect AND Device to be removed is not existing!")

        BuiltIn().log_to_console(" ")
        for i in range (0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues_removeDevice       = { 
                    "sessionid": session,
                    "eid": str(fms_devices[i])
                    }
                response         = requests.post(url=requestAPI_removeDevice, data=dataValues_removeDevice)
                jsonReply        = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console("fmsRemoveDevices(2nd Step): Length of Device EUI is incorrect AND Device to be removed is not existing!")