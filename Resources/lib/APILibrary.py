import json
import os
import time
from datetime import date, datetime, timedelta

import PYXL
import requests
from robot.libraries.BuiltIn import BuiltIn


class APILibrary:
    VERSION = 1.0

    def __init__(self, testfile=None, testserver=None):
        if testfile is not None and testserver is not None:
            global g_testfile
            global g_testserver
            g_testfile = testfile
            g_testserver = testserver

    def getUTCTime(self):
        now = datetime.utcnow()
        return now

    def convertTime(self, time):
        return datetime.strptime(time, '%Y-%m-%dT%H:%M:%S.%fZ')

    def get_time_period(self, delta=0):
        before = date.today() - timedelta(1 + delta)
        before = before.strftime('%y-%m-%d')
        after = date.today() - timedelta(2 + delta)
        after = after.strftime('%y-%m-%d')
        return before, after

    def createSessionFile(self):
        os.chdir('../Resources')
        if not os.path.exists('cookie.txt'):
            file('cookie.txt', 'w').close

    def print_response_data(self, data, *list):
        for element in list:
            BuiltIn().log(element + " in response = " + str(data[element]), console="True")

    def check_response(self, res):
        if res is not None:
            BuiltIn().log(" **** Response validate Successful. ****", "INFO")
        else:
            BuiltIn().log(" **** Response validate Failed. ****", "ERROR")

    ########################################
    ###   1 User Login                   ###
    ########################################

    def userLogin(self, urlRequest, username, password):

        self.createSessionFile()

        # No session id in cookie file.
        if os.stat("cookie.txt").st_size == 0:

            userLoginRequest = urlRequest + '/login'
            dataValues = {"username": username, "password": password}
            response = requests.post(url=userLoginRequest, data=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')
            BuiltIn().log_to_console('\n')

            if retStatus == 'ok':
                f = open('cookie.txt', 'w')
                f.write(retSessionID)
                f.close()
                retSessionID = jsonReply['sessionid'].encode('utf-8')
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
            dataValues = {"sessionid": sessionid}
            response = requests.post(url=checkLoginRequest, data=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')

            # Old session id still valid.
            if retStatus == 'ok':
                retSessionID = jsonReply['sessionid'].encode('utf-8')
                BuiltIn().log_to_console('*** Login Successful. ***')
                return retSessionID
            else:
                userLoginRequest = urlRequest + '/login'
                dataValues = {"username": username, "password": password}
                response = requests.post(url=userLoginRequest, data=dataValues)
                jsonReply = json.loads(response.text)
                retStatus = jsonReply['response'].encode('utf-8')

                if retStatus == 'ok':
                    retSessionID = jsonReply['sessionid'].encode('utf-8')
                    f = open('cookie.txt', 'w')
                    f.write(retSessionID)
                    f.close()
                    BuiltIn().log_to_console(retSessionID)
                    BuiltIn().log_to_console('*** Login Successful. ***')
                    return retSessionID
                else:
                    BuiltIn().log_to_console('*** Login Failed. ***')
                    return None

    def userLoginXLS(self):
        session = PYXL.set_session_by_header(g_testfile, g_testserver)
        return session

    ########################################
    ###   2 Get All Online Devices       ###
    ########################################

    def getAllOnlineDevices(self):
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        devices = []
        userLoginRequest = urlRequest + '/getDeviceInfo'
        dataValues = {"sessionid": session}
        response = requests.post(url=userLoginRequest, data=dataValues)
        jsonReply = json.loads(response.text)

        for obj in range(0, len(jsonReply)):
            if jsonReply[obj]['status'] == 'Online':
                devices.append(jsonReply[obj]['eid'].encode('utf-8'))

        # BuiltIn().log_to_console("******************** All Online Devices ********************")
        # for dev in devices:
        #     BuiltIn().log_to_console(dev)
        return devices

    def getDevices(self):

        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        devices = []
        userLoginRequest = urlRequest + '/getDeviceInfo'
        dataValues = {"sessionid": session}
        response = requests.post(url=userLoginRequest, data=dataValues)
        jsonReply = json.loads(response.text)

        for obj in range(0, len(jsonReply)):
            if (
                                        jsonReply[obj]['status'] == 'Online' or
                                        jsonReply[obj]['status'] == "Offline" or
                                    jsonReply[obj]['status'] == "Uncommissioned" or
                                jsonReply[obj]['status'] == "0" or
                            jsonReply[obj]['status'] is None
            ):
                devices.append(jsonReply[obj]['eid'].encode('utf-8'))
        BuiltIn().log_to_console("")
        for dev in devices:
            BuiltIn().log_to_console(dev)
        return devices

    ########################################
    ###   3 Send Command To Device       ###
    ########################################

    def deviceSendCommand(self, urlRequest, session, Command, devEID, cmd_params=''):
        cookie = {"sessionid": session}
        requestAPI = urlRequest + '/DeviceSendCommand'

        if cmd_params:
            dataValues = {"eid": devEID, "name": Command}
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
        else:
            dataValues = {"eid": devEID, "name": Command}
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
        sessionid = PYXL.set_session_by_header(g_testfile, server)
        urlRequest = PYXL.get_url_by_header(g_testfile, server)
        cookie = {"sessionid": sessionid}

        ## cmd_page:      Sheet[yl_command], Sheet[yl_command_test]
        commands = PYXL.get_commands_by_sheet(g_testfile, cmd_page)

        requestAPI = urlRequest + '/DeviceSendCommand'

        cid = []
        for cmd in commands:
            cmd_name, cmd_para = str(cmd[0]), str(cmd[1])
            dataValues = {"eid": devEID, "name": cmd_name}
            if cmd_para != "None":
                if cmd_para.count("=") == 1:
                    para_name = cmd_para.rsplit('=', 1)[0]
                    para_value = cmd_para.rsplit('=', 1)[1]
                    dataValues.update({para_name: para_value})
                elif cmd_para.count("=") > 1:
                    for para in cmd_para.split(','):
                        para_name = para.rsplit('=', 1)[0]
                        para_value = para.rsplit('=', 1)[1]
                        dataValues.update({para_name: para_value})
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
        cookie = {"sessionid": session}
        requestAPI = urlRequest + '/getTransactions'
        dataValues = {"eid": devEID, "qtype": "cid,command,status",
                      "query": str(cid) + "," + Command + "," + "Responded*"}
        response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)

        jsonReply = json.loads(response.text)

        BuiltIn().log_to_console(len(jsonReply['rows']))
        starttime = BuiltIn().get_variable_value("${STARTTIME}")

        if len(jsonReply['rows']) >= 1:
            for i in range(0, len(jsonReply['rows'])):
                if self.convertTime(jsonReply['rows'][i]['time'].encode('utf-8')) > starttime:
                    BuiltIn().log_to_console(
                        "start time = " + str(starttime) + " response time was " + jsonReply['rows'][i]['time'])
                    return jsonReply['rows'][i]['data'].encode('utf-8')
                else:
                    BuiltIn().log_to_console(
                        "start time = " + str(starttime) + " response time was " + jsonReply['rows'][i]['time'])
                    return None
        else:
            return None

    ########################################
    ###   5 Brocaar Application Server   ###
    ########################################
    def addNodesToAS(self):

        dev_euis = PYXL.get_as_dev_eui(g_testfile)
        app_eui = PYXL.get_as_app_eui(g_testfile)
        app_key = PYXL.get_as_app_key(g_testfile)
        node_name = PYXL.get_as_node_name(g_testfile)
        as_url = PYXL.get_as_server_url(g_testfile, g_testserver)

        requestAPI = as_url + '/api/node'
        headers = {'Grpc-Metadata-Authorization': 'ghydOwk7fX9XVX+Ssm4Doif+RRC83NP5DVeX8jvh5J0=',
                   'Content-Type': 'application/json'}
        BuiltIn().log_to_console(" ")
        for i in range(0, len(dev_euis)):
            if len(dev_euis[i]) == 16 and dev_euis is not None:
                dataValues = {
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
                    BuiltIn().log_to_console(
                        "Device " + str(dev_euis[i]) + " failed to be added to Application Server.")
            else:
                BuiltIn().log_to_console("Length of Device EUI is incorrect or equals None: -> " + str(
                    dev_euis[i]) + " <- failed to be added to Application Server.")

    def deleteNodesFromAS(self):
        dev_euis = PYXL.get_as_dev_eui(g_testfile)
        as_url = PYXL.get_as_server_url(g_testfile, g_testserver)
        BuiltIn().log_to_console(" ")
        for i in range(0, len(dev_euis)):
            if len(dev_euis[i]) == 16 and dev_euis is not None:
                requestAPI = as_url + '/api/node' + '/' + str(dev_euis[i])
                response = requests.delete(url=requestAPI, verify=False)
                # BuiltIn().log_to_console("Delete Device " + str(dev_euis[i]) + " -> " + str(response.reason))
                if response.reason == "OK":
                    BuiltIn().log_to_console(
                        "Device " + str(dev_euis[i]) + " has been removed from Application Server.")
                else:
                    BuiltIn().log_to_console(
                        "Device " + str(dev_euis[i]) + " failed to be removed from Application Server.")
            else:
                BuiltIn().log_to_console("Length of Device EUI is incorrect or equals None: -> " + str(
                    dev_euis[i]) + " <- failed to be removed from Application Server.")

    ########################################
    ###   6 FMS   ###
    ########################################

    # def fmsAddDevices(self, urlRequest, session, gw_eid, app_bundle, dev_type, *dev_eid):
    def fmsAddDevices(self):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        gw_eid = PYXL.get_gw_by_header(g_testfile, g_testserver)
        dev_type = PYXL.get_dev_type_by_header(g_testfile, g_testserver)
        app_bdl_yl = PYXL.get_app_bdl_yl_by_header(g_testfile, g_testserver)
        meter_serial = PYXL.get_meter_serial(g_testfile)
        app_bundle = app_bdl_yl

        requestAPI = urlRequest + '/addDevice'
        avb_devices = self.getDevices()
        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] not in avb_devices:
                dataValues = {
                    "sessionid": session,
                    "eid": str(fms_devices[i]),
                    "gw_eid": str(gw_eid),
                    "device_type": str(dev_type),
                    "bundle_name": str(app_bundle)
                }
                response = requests.post(url=requestAPI, data=dataValues)
                jsonReply = json.loads(response.text)
            else:
                BuiltIn().log_to_console("")
                BuiltIn().log_to_console("fmsAddDevices: " + fms_devices[
                    i] + " Length of Device EUI is incorrect OR Device already existing!")

    def fmsEditDevices(self):
        meter_serial = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, meter_serial)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)

        requestAPI_editEID = urlRequest + '/setDevice'
        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i]:
                dataValues_edit = {
                    "sessionid": session,
                    "edit_eid": str(fms_devices[i]),
                    "meter_serial_no": str(meter_serial)
                }
                response = requests.post(url=requestAPI_editEID, data=dataValues_edit)
                jsonReply = json.loads(response.text)
            else:
                BuiltIn().log_to_console("")
                BuiltIn().log_to_console("fmsEditDevices: " + fms_devices[
                    i] + " Length of Device EUI is incorrect OR Device already existing!")

    def fmsActivateDevices(self):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        gw_eid = PYXL.get_gw_by_header(g_testfile, g_testserver)
        requestAPI = urlRequest + '/gatewayActivateDevice'
        avb_devices = self.getDevices()

        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues = {
                    "sessionid": session,
                    "eid": str(fms_devices[i]),
                    "gw_eid": str(gw_eid)
                }
                response = requests.post(url=requestAPI, data=dataValues)
                jsonReply = json.loads(response.text)
                BuiltIn().log_to_console(" ")
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console(" ")
                BuiltIn().log_to_console("fmsActivateDevices: " + fms_devices[
                    i] + " Length of Device EUI is incorrect AND Device to be activated is not existing!")

    def fmsDeviceRemoveApp(self):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        requestAPI = urlRequest + '/deviceRemoveApp'
        avb_devices = self.getDevices()

        BuiltIn().log_to_console(" ")
        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues = {
                    "sessionid": session,
                    "eid": str(fms_devices[i])
                }
                response = requests.post(url=requestAPI, data=dataValues)
                jsonReply = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console(
                    "fmsDeviceRemoveApp: Length of Device EUI is incorrect AND Device to be removed is not existing!")

    def fmsDeviceUpdateApp(self):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        new_app = PYXL.get_app_update_version(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)

        requestAPI = urlRequest + '/setDevice'
        avb_devices = self.getDevices()

        BuiltIn().log_to_console(" ")
        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues = {
                    "sessionid": session,
                    "edit_eid": str(fms_devices[i]),
                    "bundle_name": str(new_app)
                }
                response = requests.post(url=requestAPI, data=dataValues)
                jsonReply = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console(
                    "fmsDeviceUpdateApp: Length of Device EUI is incorrect AND Device to be removed is not existing!")

    def fmsRemoveDevices(self):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        gw_eid = PYXL.get_gw_by_header(g_testfile, g_testserver)
        requestAPI_gwDelete = urlRequest + '/gatewayDeleteDevice'
        requestAPI_removeDevice = urlRequest + '/removeDevice'

        avb_devices = self.getDevices()
        BuiltIn().log_to_console(" ")

        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues_gwDelete = {
                    "sessionid": session,
                    "eid": str(fms_devices[i]),
                    "gw_eid": str(gw_eid)
                }
                for step in range(0, 2):
                    response = requests.post(url=requestAPI_gwDelete, data=dataValues_gwDelete)
                    # time.sleep(5)
                jsonReply = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console(
                    "fmsRemoveDevices(1st Step): Length of Device EUI is incorrect AND Device to be removed is not existing!")

        BuiltIn().log_to_console(" ")
        for i in range(0, len(fms_devices)):
            if len(fms_devices[i]) == 16 and fms_devices[i] in avb_devices:
                dataValues_removeDevice = {
                    "sessionid": session,
                    "serial": str(fms_devices[i])
                }
                for step in range(0, 2):
                    response = requests.post(url=requestAPI_removeDevice, data=dataValues_removeDevice)
                    # time.sleep(5)
                jsonReply = json.loads(response.text)
                BuiltIn().log_to_console(jsonReply)
            else:
                BuiltIn().log_to_console(
                    "fmsRemoveDevices(2nd Step): Length of Device EUI is incorrect AND Device to be removed is not existing!")

    def deviceSendInitCommand(self, command):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        cookie = {"sessionid": session}

        requestAPI = urlRequest + '/DeviceSendCommand'
        eid_cid = {}
        for dev in fms_devices:
            dataValues = {"eid": str(dev), "name": command}

            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')

            if retStatus == 'ok':
                eid_cid.update({str(dev): str(jsonReply['cid'])})
        return eid_cid

    def deviceSendCommand(self, command, params=None):
        dev_header = PYXL.get_meter_serial(g_testfile)
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        fms_devices = PYXL.get_devices_by_header(g_testfile, dev_header)
        cookie = {"sessionid": session}

        requestAPI = urlRequest + '/DeviceSendCommand'
        eid_cid = {}

        if params is not None and params != "":
            if params.count("=") == 1:
                cmd_name = str(params).rsplit('=', 1)[0]
                cmd_par = str(params).rsplit('=', 1)[1]

        for dev in fms_devices:
            dataValues = {"eid": str(dev), "name": command, str(cmd_name): int(cmd_par)}

            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')

            if retStatus == 'ok':
                eid_cid.update({str(dev): str(jsonReply['cid'])})
        return eid_cid

    def ValidateInitCommand(self, command, **eid_cid):
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        cookie = {"sessionid": session}

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
                dataValues = {"eid": str(eid), "qtype": "cid,command,status",
                              "query": str(cid) + "," + str(command) + "," + "Responded*", "after": str(trans_min_time)}
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

    ########################################
    ###   7 REPORT   ###
    ########################################
    def report_daily_reading(self, delta=0):
        before, after = self.get_time_period(delta)
        # 1. Date Period
        period = str(after) + " ~ " + str(before)

        # 2. Total All Devices
        total_devices = self.getDevices()
        total_devices_num = len(total_devices)
        BuiltIn().log_to_console(" **** total_devices = " + str(total_devices) + " **** " )

        # 3. Total Online Devices
        total_online_devices = self.getAllOnlineDevices()
        total_online_devices_num = len(total_online_devices)
        BuiltIn().log_to_console(" **** total_online_devices = " + str(total_online_devices) + " **** " )


        # 4. Device Availablilty Rate
        if int(total_devices_num == 0):
            online_rate = 0
        else:
            online_rate = int(total_online_devices_num) * 1.0 / int(total_devices_num) * 1.00
        online_rate = '{:.2%}'.format(online_rate)

        # 5. Unsolicited msg Received
        has_data, has_no_data = self.get_unsocilited_response("GET_METER_SUMMATION_DELIVERED")
        has_data_num = len(has_data)
        BuiltIn().log_to_console(" **** GET_METER_SUMMATION_DELIVERED has_data_num = " + str(has_data_num) + " **** " )

        # 6. Unsolicited msg not Received
        has_no_data_num = len(has_no_data)
        BuiltIn().log_to_console(" **** GET_METER_SUMMATION_DELIVERED has_no_data_num = " + str(has_no_data_num) + " **** " )

        # 7. Unsolicited msg Received Rate
        if int(total_online_devices_num == 0):
            online_rate = 0
        else:
            reading_rate = int(has_data_num) * 1.0 / int(total_online_devices_num) * 1.00
        reading_rate = '{:.2%}'.format(reading_rate)

        # 8. Scheduled msg not Reived
        has_data_c, has_no_data_c, timeout_data_c = self.get_requested_response("GET_SUMMATION_REPORT_INTERVAL")
        has_no_data_c_num = len(has_no_data_c)
        timeout_data_c_num = len(timeout_data_c)
        BuiltIn().log_to_console(" **** GET_SUMMATION_REPORT_INTERVAL has_no_data_c_num = " + str(has_no_data_c_num) + " **** " )
        BuiltIn().log_to_console(" **** GET_SUMMATION_REPORT_INTERVAL timeout_data_c_num = " + str(timeout_data_c_num) + " **** " )

        # 9. Scheduled msg Rceived
        has_data_c_num = len(has_data_c)
        BuiltIn().log_to_console(" **** GET_SUMMATION_REPORT_INTERVAL has_data_c_num = " + str(has_data_c_num) + " **** " )

        # 10. Scheduled msg Rate
        if int(total_online_devices_num == 0):
            online_rate = 0
        else:
            reading_rate_c = int(has_data_c_num) * 1.0 / int(total_online_devices_num) * 1.00
        reading_rate_c = '{:.2%}'.format(reading_rate_c)

        row_data = []
        row_data.extend([str(period),
                         str(total_devices_num),
                         str(total_online_devices_num),
                         str(online_rate),
                         str(has_no_data_num),
                         str(has_data_num),
                         str(reading_rate),
                         str(has_no_data_c_num),
                         str(timeout_data_c_num),
                         str(has_data_c_num),
                         str(reading_rate_c),
                         str(has_no_data),
                         str(has_no_data_c),
                         str(timeout_data_c)])

        BuiltIn().log_to_console(str(row_data))
        PYXL.append_to_report("daily_reading_report.xlsx", *row_data)

    def get_unsocilited_response(self, command, delta=0):
        # CID = 0
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        cookie = {"sessionid": session}
        requestAPI = urlRequest + '/getTransactions'

        devices = self.getAllOnlineDevices()
        before, after = self.get_time_period(delta)

        has_no_data = []
        has_data = []

        for eid in devices:
            dataValues = {"eid": str(eid), "qtype": "cid,command,status",
                          "query": str(0) + "," + str(command) + "," + "Responded*", "after": str(after),
                          "before": str(before)}
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            if len(str(jsonReply['rows'])) > 2:  # if there is no data, the length of rows key should be 2
                has_data.append(str(eid))
            else:
                has_no_data.append(str(eid))

        BuiltIn().log_to_console(str(after) + " ~ " + str(before))
        BuiltIn().log_to_console("\n*** Devices has no unsocilited list ***\n" + str(has_no_data))
        BuiltIn().log_to_console("\n*** Devices has unsocilited list ***\n" + str(has_data))
        return has_data, has_no_data

    def get_requested_response(self, command, delta=0):
        # CID > 0
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        cookie = {"sessionid": session}
        requestAPI = urlRequest + '/getTransactions'

        devices = self.getAllOnlineDevices()
        before, after = self.get_time_period(delta)

        has_no_data = []
        has_data = []
        timeout_data = []

        for eid in devices:
            dataValues = {"eid": str(eid), "qtype": "cid,command,status",
                          "query": ">0" + "," + str(command) + "," + "Responded*", "after": str(after),
                          "before": str(before)}
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            if len(str(jsonReply['rows'])) > 2:  # if there is no data, the length of rows key should be 2
                if "MP_STATUS_NO_RESPONSE_FROM_NIC" in str(jsonReply['rows'][0]):
                    timeout_data.append(str(eid))
                else:
                    has_data.append(str(eid))
            else:
                has_no_data.append(str(eid))

        BuiltIn().log_to_console(str(after) + " ~ " + str(before))
        BuiltIn().log_to_console("\n*** Devices has no scheduled list ***\n" + str(has_no_data))
        BuiltIn().log_to_console("\n*** Devices has scheduled list ***\n" + str(has_data))
        return has_data, has_no_data, timeout_data

    def send_command_to_online_devices(self, command, params=None):
        urlRequest = PYXL.get_url_by_header(g_testfile, g_testserver)
        session = PYXL.get_session_by_header(g_testfile, g_testserver)
        cookie = {"sessionid": session}
        requestAPI = urlRequest + '/DeviceSendCommand'
        eid_cid = {}

        devices = self.getAllOnlineDevices()

        if params is not None and params != "":

            if params.count("=") == 1:
                cmd_name = str(params).rsplit('=', 1)[0]
                cmd_par = str(params).rsplit('=', 1)[1]

        else:
            cmd_name = None
            cmd_par = None

        for eid in devices:
            if cmd_name is not None and cmd_par is not None:
                dataValues = {"eid": str(eid), "name": command, str(cmd_name): int(cmd_par)}
            else:
                dataValues = {"eid": str(eid), "name": command}
            response = requests.get(url=requestAPI, cookies=cookie, params=dataValues)
            jsonReply = json.loads(response.text)
            retStatus = jsonReply['response'].encode('utf-8')

            if retStatus == 'ok':
                BuiltIn().log_to_console(command + " has been sent to " + str(eid))
                eid_cid.update({str(eid): str(jsonReply['cid'])})
            else:
                BuiltIn().log_to_console(command + " failed to sent to " + str(eid))
        return eid_cid

