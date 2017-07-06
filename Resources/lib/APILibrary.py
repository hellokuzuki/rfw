import requests
import time
import logging
import json
import os
import PYXL
from datetime import datetime, timedelta
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from openpyxl import load_workbook


class APILibrary():

    VERSION = 1.0

    g_testfile = None

    def __init__(self, testfile=None):
        global g_testfile
        global g_testserver
        
        if testfile is not None:
            g_testfile = testfile

    def getUTCTime(self):
        now = datetime.utcnow()
        return now

    def convertTime(self, time):
        return datetime.strptime(time,'%Y-%m-%dT%H:%M:%S.%fZ')

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

        # cid = self.deviceSendCommands(header,'yl_command_test', "7ff9010202000006")
        # BuiltIn().log_to_console(str(cid))
        # for cmd in commands:
        #     cmd_name, cmd_para = str(cmd[0]), str(cmd[1])
        #     if cmd_para == "None":
        #         dataValues = {"eid":devEID, "name":cmd_name}
        #     else:
        #         dataValues = {"eid":devEID, "name":cmd_name}
        pass

    def get_app_eui(self):
        euis = PYXL.get_as_dev_eui(g_testfile)
        BuiltIn().log_to_console(str(euis))

        app_eui = PYXL.get_as_app_eui(g_testfile)
        BuiltIn().log_to_console(str(app_eui))

        app_key = PYXL.get_as_app_key(g_testfile)
        BuiltIn().log_to_console(str(app_key))

        node_name = PYXL.get_as_node_name(g_testfile)
        BuiltIn().log_to_console(str(node_name))

        as_url1 = PYXL.get_as_url(g_testfile)
        BuiltIn().log_to_console(str(as_url1))



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

    def userLoginXLS(self, server):
        session = PYXL.set_session_by_header(g_testfile, server)
        return session

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
    def addNodesToAS(self):
        dev_euis    = PYXL.get_as_dev_eui(g_testfile)
        app_eui     = PYXL.get_as_app_eui(g_testfile)
        app_key     = PYXL.get_as_app_key(g_testfile)
        node_name   = PYXL.get_as_node_name(g_testfile)
        as_url      = PYXL.get_as_url(g_testfile)

        requestAPI  = as_url + '/api/node'
        headers     = {'Grpc-Metadata-Authorization': 'ghydOwk7fX9XVX+Ssm4Doif+RRC83NP5DVeX8jvh5J0=', 'Content-Type': 'application/json'}
        BuiltIn().log_to_console(" ")
        for i in range (0, len(dev_euis)):
            if len(dev_euis[i]) == 16:
                dataValues  = {
                      "devEUI": str(dev_euis[i]),
                      "appEUI": str(app_eui),
                      "appKey": str(app_key),
                      "rxDelay": 0,
                      "rx1DROffset": 0,
                      "channelListID": "0",
                      "rxWindow": "RX1",
                      "rx2DR": 0,
                      "name": str(node_name) + " " + str(dev_euis[i]),
                      "relaxFCnt": False
                }

                response = requests.post(url=requestAPI, data=json.dumps(dataValues), headers=headers, verify=False)
                BuiltIn().log_to_console(str(response.reason))
                if response.reason == "OK":
                    BuiltIn().log_to_console("Device " + str(dev_euis[i]) + " has been added to Application Server.")
                else:
                    BuiltIn().log_to_console("Device " + str(dev_euis[i]) + " failed to be added to Application Server.")
            else:
                BuiltIn().log_to_console("Length of Device EUI is incorrect:  " + str(dev_euis[i]) + " failed to be added to Application Server.")

    def deleteNodesFromAS(self):
        dev_euis    = PYXL.get_as_dev_eui(g_testfile)
        as_url      = PYXL.get_as_url(g_testfile)
        BuiltIn().log_to_console(" ")
        for i in range (0, len(dev_euis)):
            if len(dev_euis[i]) == 16:
                requestAPI  = as_url + '/api/node' + '/' + str(dev_euis[i])
                response = requests.delete(url=requestAPI, verify=False)
                # BuiltIn().log_to_console("Delete Device " + str(dev_euis[i]) + " -> " + str(response.reason))
                if response.reason == "OK":
                    BuiltIn().log_to_console("Device " + str(dev_euis[i]) + " has been removed from Application Server.")
                else:
                    BuiltIn().log_to_console("Device " + str(dev_euis[i]) + " failed to be removed from Application Server.")
            else:
                BuiltIn().log_to_console("Length of Device EUI is incorrect:  " + str(dev_euis[i]) + " failed to be removed from Application Server.")

    ########################################
    ###   6 FMS   ###
    ########################################

    # def fmsAddDevices(self, urlRequest, session, gw_eid, app_bundle, dev_type, *dev_eid):
    def fmsAddDevices(self, testServer, dev_header):
        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        gw_eid      = PYXL.get_gw_by_header(g_testfile, testServer)
        dev_type    = PYXL.get_dev_type_by_header(g_testfile, testServer)
        app_bdl_yl  = PYXL.get_app_bdl_yl_by_header(g_testfile, testServer)
        app_bundle  = app_bdl_yl
        # app_bdl_mc  = PYXL.get_app_bdl_mc_by_header(g_testfile, testServer)
        # BuiltIn().log_to_console(urlRequest)
        # BuiltIn().log_to_console(str(fms_devices))
        # BuiltIn().log_to_console(str(session))
        # BuiltIn().log_to_console(str(gw_eid))
        # BuiltIn().log_to_console(str(dev_type))
        # BuiltIn().log_to_console(str(app_bdl_yl))
        # BuiltIn().log_to_console(str(app_bdl_mc))

        requestAPI = urlRequest + '/addDevice'
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

    def fmsActivateDevices(self, testServer, dev_header):
        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        gw_eid      = PYXL.get_gw_by_header(g_testfile, testServer)
        requestAPI  = urlRequest + '/gatewayActivateDevice'
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

    def fmsDeviceRemoveApp(self, testServer, dev_header):
        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        requestAPI  = urlRequest + '/deviceRemoveApp'
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

    def fmsDeviceUpdateApp(self, testServer, dev_header):
        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        new_app     = PYXL.get_app_update_version(g_testfile, testServer)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)

        requestAPI = urlRequest + '/setDevice'
        avb_devices = self.getDevices(urlRequest, session)

        BuiltIn().log_to_console(" ")
        for i in range (0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues       = { 
                    "sessionid": session,
                    "edit_eid": str(fms_devices[i]),
                    "bundle_name": str(new_app)
                    }
                response         = requests.post(url=requestAPI, data=dataValues)
                jsonReply        = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console("fmsDeviceUpdateApp: Length of Device EUI is incorrect AND Device to be removed is not existing!")


    def fmsRemoveDevices(self, testServer, dev_header):
        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        requestAPI_setDevice     = urlRequest + '/setDevice'
        requestAPI_removeDevice  = urlRequest + '/removeDevice'

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

    def deviceSendInitCommand(self, testServer, dev_header, command):

        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        cookie = {"sessionid":session}

        requestAPI = urlRequest + '/DeviceSendCommand'
        eid_cid = {}
        for dev in fms_devices:
            dataValues = {"eid":str(dev), "name":command}

            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')

            if retStatus == 'ok':
                eid_cid.update({str(dev) : str(jsonReply['cid'])})
        return eid_cid

    def ValidateInitCommand(self, testServer, command, **eid_cid):

        urlRequest  = PYXL.get_url_by_header(g_testfile, testServer)
        session     = PYXL.get_session_by_header(g_testfile, testServer)
        cookie = {"sessionid":session}

        requestAPI = urlRequest + '/getTransactions'
        trans_min_time = datetime.utcnow() - timedelta(minutes=45)
        trans_min_time = trans_min_time.strftime("%Y-%m-%d %H:%M:%S")

        validate_time = datetime.utcnow()
        validate_time = validate_time.strftime("%Y-%m-%d %H:%M:%S")

        timedout_time = datetime.utcnow() + timedelta(minutes=45)
        # timedout_time = timedout_time.strftime("%Y-%m-%d %H:%M:%S")

        while True:
            BuiltIn().log_to_console("current time = " + str(datetime.utcnow()))
            BuiltIn().log_to_console("timedout time = " + str(timedout_time.strftime("%Y-%m-%d %H:%M:%S")))
            BuiltIn().log_to_console("datetime.utcnow() > timedout_time" + str(datetime.utcnow() > timedout_time))
            for eid, cid in eid_cid.items():
                dataValues = {"eid":str(eid), "qtype":"cid,command,status", "query":str(cid) + "," + str(command) + "," + "Responded*", "after":str(trans_min_time)}
                response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
                jsonReply = json.loads(response.text)

                if len(jsonReply['rows']) == 1:
                    eid_cid.pop(str(eid))
                    BuiltIn().log_to_console(str(eid) + " Popped ")
                    continue
                elif len(jsonReply['rows']) > 1:
                    BuiltIn().log_to_console(" Not poped because row > 1 ")
                    BuiltIn().log_to_console(str(jsonReply))
                    continue
                else:
                    continue
            if len(eid_cid) == 0:
                return
            elif datetime.utcnow() > timedout_time:
                break
            else:
                while True:
                    time.sleep(60)
                    BuiltIn().log_to_console(" Waited for 1 min ")
                    break
        BuiltIn().log(" **** Timed out response Found! ****", "ERROR")
        BuiltIn().log_to_console(" **** Timed out response Found! ****" + str(eid_cid))
        return eid_cid

