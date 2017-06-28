import requests
import json
from robot.libraries.BuiltIn import BuiltIn

def SetSessionID(urlRequest):   #,sessionID):
#    if sessionID == "validSessionID":
    sessionID = ''
    with open("c:/cookie.txt","r+") as cookieFile:
        sessionID = cookieFile.readline()
        cookieFile.seek(0,0)
        cookie    = {"sessionid":sessionID}
        
        #verify if session id stored in c:/cookie.txt is valid
        #if not then login again,write the session id to the text file
        checkLoginRequest = urlRequest + '/checklogin' 
        r                 = requests.get(url=checkLoginRequest,cookies=cookie)
        jsonReply         = json.loads(r.text)
        retResponse       = jsonReply['response']
        if retResponse   != 'ok':
            r             = requests.Session()
            loginRequest  = urlRequest + '/login'
            dataValues    = {"username":'freestyle', "password":"freestyle"}
            response      = r.post(url=loginRequest,data=dataValues) 
            jsonReply     = json.loads(response.text)
            sessionID     = jsonReply["sessionid"]
            cookieFile.write(jsonReply["sessionid"])
        cookieFile.close()
    return(sessionID)

def processRequest(urlRequest,APIcommand,sessionID,params=''):
    cookie     = {"sessionid":sessionID}
    requestAPI = urlRequest + '/' + APIcommand
    if params: r=requests.get(url=requestAPI,cookies=cookie,params=params)
    else: r=requests.get(url=requestAPI,cookies=cookie)
    jsonReply  = json.loads(r.text)
    recCount   = 0
    retRecords = "\n"
    rows       = ''
    if 'command:' in str(jsonReply): retCommand = jsonReply['command']
    else:                            retCommand = APIcommand
    if "API /" in str(jsonReply):    retRecords = str(jsonReply)
    else:
#        BuiltIn().log_to_console("\n"+str(jsonReply))
        responseAPI = eval(str(jsonReply)) 
        if isinstance(responseAPI, dict):
            if 'rows\':'     in str(jsonReply): rows = jsonReply['rows']
            if 'result\':'   in str(jsonReply): rows = jsonReply['result']
            if 'sessions\':' in str(jsonReply): rows = jsonReply['sessions']
            if 'aaData\':'   in str(jsonReply):
                retRecords   = retRecords + "iTotalDisplayRecords: " + str(jsonReply['iTotalDisplayRecords']) + "\niTotalRecords       : " + str(jsonReply['iTotalRecords']) + "\naaData:\n"
                rows         = jsonReply['aaData']
            if 'bundle\':'   in str(jsonReply):
                if APIcommand == 'getApplicationCmds': rows = jsonReply['bundle']['command_list']
            if rows: 
                rowsEval = eval(str(rows))
                if isinstance(rowsEval, dict):
                    for details in rows.iteritems():
                        retRecords = retRecords + str(details) + "\n"
                        recCount   = recCount+1
                else:
                    for details in list(rows):
                        retRecords = retRecords + str(details) + "\n"
                        recCount   = recCount + 1
            else:       retRecords = str(jsonReply)
        elif isinstance(responseAPI, list):
            for device in list(jsonReply):
                retRecords = retRecords + str(device) + "\n"
                recCount   = recCount + 1
        else: raise exception("unsupported data format")
    return(retCommand,recCount,retRecords)

def setParams(eid='',gwEID='',activateTime='',address='',appName='',after='',before='',bundleID='',bundleName='',columns='',comment='',createdBy='',customerID='',deviceList='',deviceManufacturer='',deviceOwner='',deviceType='',displayName='',eventID='',guardTime='',GPS_Lat='',GPS_Lng='',industry='',installCode='',limit='',marketSegment='',member='',meterSerialNo='',name='',owner='',page='',params='',policy='',qtype='',query='',role='',rp='',segment='',sortname='',sortorder='',startTime='',type=''):
    reqParams              = {}
    if eid:                reqParams['eid']                 = eid
    if gwEID:              reqParams['gw_eid']              = gwEID
    if activateTime:       reqParams['activate_time']       = activateTime
    if address:            reqParams['address']             = address
    if appName:            reqParams['appname']             = appName
    if after:              reqParams['after']               = after
    if before:             reqParams['before']              = before
    if bundleID:           reqParams['bundle_id']           = bundleID
    if bundleName:         reqParams['bundle_name']         = bundleName
    if columns:            reqParams['columns']             = columns
    if comment:            reqParams['comment']             = comment
    if createdBy:          reqParams['created_by']          = createdBy
    if customerID:         reqParams['customer_id']         = customerID
    if deviceList:         reqParams['device_list']         = deviceList
    if deviceManufacturer: reqParams['device_manufacturer'] = deviceManufacturer
    if deviceOwner:        reqParams['device_owner']        = deviceOwner
    if deviceType:         reqParams['device_type']         = deviceType
    if displayName:        reqParams['display_name']        = displayName
    if eventID:            reqParams['event_id']            = eventID
    if guardTime:          reqParams['guard_time']          = guardTime
    if GPS_Lat:            reqParams['gps_lat']             = GPS_Lat
    if GPS_Lng:            reqParams['gps_lng']             = GPS_Lng
    if industry:           reqParams['industry']            = industry
    if installCode:        reqParams['install_code']        = installCode
    if limit:              reqParams['limit']               = limit
    if marketSegment:      reqParams['market_segment']      = marketSegment
    if member:             reqParams['member']              = member
    if meterSerialNo:      reqParams['meter_serial_no']     = meterSerialNo
    if name:               reqParams['name']                = name
    if owner:              reqParams['owner']               = owner
    if page:               reqParams['page']                = page
    if params:             reqParams['params']              = params
    if policy:             reqParams['policy']              = policy
    if qtype:              reqParams['qtype']               = qtype
    if query:              reqParams['query']               = query
    if role:               reqParams['role']                = role
    if rp:                 reqParams['rp']                  = rp
    if segment:            reqParams['segment']             = segment
    if sortname:           reqParams['sortname']            = sortname
    if sortorder:          reqParams['sortorder']           = sortorder
    if startTime:          reqParams['start_time']          = startTime
    if type:               reqParams['type']                = type
#    BuiltIn().log_to_console("\reqParams -- "+str(reqParams))
    return(reqParams)

def commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID):
    if commandText == '-- with invalid session ID' or commandText == '-- with blank session ID':
        expectedResponse = '{response: ' + urlReturned + '> sessionid is required to access API /' + APIcommand + ' from  ' + urlReturned + '}'
    if commandText == '-- with invalid device':
        expectedResponse = '{status: EID value supplied is not a valid formatted value, contains invalid chars, command: ' + APIcommand + ', response: Error, eid: ' + devEID + '}'
    if commandText == '-- with blank device':
        expectedResponse = '{command: ' + APIcommand + ', response: Missing required parameter eid is needed}'
    if commandText == '-- with device not found':
        expectedResponse = '{command: ' + APIcommand + ', response: Meter  does not exist}'
    if commandText == '-- with invalid gateway':
        expectedResponse = '{status: EID value supplied is not a valid formatted value, contains invalid chars, command: ' + APIcommand + ', response: Error, eid: ' + gwEID + '}'
    if commandText == '-- with blank gateway':
        expectedResponse = '{command: ' + APIcommand + ', response: Missing required parameter gw_eid is needed}'
    if commandText == '-- with gateway not found':
        expectedResponse = '{command: ' + APIcommand + ', response: Gateway  does not exist}'
    if commandText == '-- with invalid bundle ID' or commandText == '-- with bundle ID not found':
        expectedResponse = '{command: ' + APIcommand + ', response: Error, the bundle_id supplied does not exist in the system}'
    if commandText == '-- with blank bundle ID':
        expectedResponse = '{command: ' + APIcommand + ', response: Missing required parameter bundle_id is needed}'
    return(expectedResponse)

########################################
###   1 ADMIN                        ###
########################################

def addClient(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,username,password,displayName,homeGPS,role,industry,prefLanguage):
    expectedResponse = ''
    userDetails      = ''
    if commandText == '-- without a username':
        expectedResponse = '{command: addClient, response: no username defined}'
    elif commandText == '-- without a password':
        expectedResponse = '{command: addClient, response: password is missing}'
    elif commandText == '-- with existing username':
        expectedResponse = '{command: addClient, response: User already exists - ' + username + '}'
    elif commandText == '-- with new username':
        expectedResponse = '{client: ' + username + ', command: addClient, response: ok}'
        userDetails = '\n  Client Name       : ' + username + '\n  Display Name      : ' + displayName
        if homeGPS:      userDetails = userDetails + '\n  Home GPS          : ' + homeGPS
        if role:         userDetails = userDetails + '\n  Role              : ' + role
        if industry:     userDetails = userDetails + '\n  Industry          : ' + industry
        if prefLanguage: userDetails = userDetails + '\n  Preferred Language: ' + prefLanguage
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = {'username':username,'password':password,'display_name':displayName,'home_gps':homeGPS,'role':role,'industry':industry,'prefered_language':prefLanguage}
    ResponseAPI = processRequest(urlRequest,'addClient',sessionID,reqParams)
    return(expectedResponse,userDetails,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def userLogin(urlRequest,commandText,username,password,userDetails):
    expectedResponse = ''
    if commandText == '-- without a username' or commandText == '-- without a password':
        expectedResponse = '{command: login, response: Your login details are missing a username or password, Mr ' + username + '}'
    if commandText == '-- with existing username':
        expectedResponse = 'A response containing the following details:' + userDetails
    r=requests.Session()
    userLoginRequest = urlRequest + '/login'
    dataValues       = {"username":username, "password":password}
    response         = r.post(url=userLoginRequest,data=dataValues)
    jsonReply        = json.loads(response.text)
    BuiltIn().log_to_console("\n"+str(jsonReply))
    retCommand       = jsonReply['command']
    if 'missing' in str(jsonReply):
        retSessionId = ''
    else:
        retSessionId  = jsonReply['sessionid']
    return(expectedResponse,retCommand,str(jsonReply),retSessionId)

def checkLogin(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,userDetails):
    expectedResponse = ''
    if commandText == '-- with valid session ID':
        expectedResponse = 'A response containing the following details:' + userDetails
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    ResponseAPI = processRequest(urlRequest,'checkLogin',sessionID,'')
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getClientSessions(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid session ID':
        expectedResponse = 'A list of all current active sessions'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    ResponseAPI = processRequest(urlRequest,'getClientSessions',sessionID)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])
	
def getClients(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,username):
    expectedResponse = ''
    if commandText == '-- with invalid username':
        expectedResponse = '{command: getclients, response: error, error: No user details found for this name ' + username + '}'
    elif commandText == '-- with existing username':
        expectedResponse = 'Current client details for ' + username
    elif commandText == '-- without a username':
        expectedResponse = 'A list of all current clients'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    if username == "": reqParams = {}
    else:              reqParams = {'username':username}
    ResponseAPI        = processRequest(urlRequest,'getClients',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getmySession(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid session ID':
        expectedResponse = 'Current client session details'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    ResponseAPI = processRequest(urlRequest,'getmySession',sessionID)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])
    
def version(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,switchVersion):
    expectedResponse = ''
    if commandText == '-- with valid session ID':
        expectedResponse = '{version: ' + switchVersion + ', command: version}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    ResponseAPI = processRequest(urlRequest,'version',sessionID)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   2 DEVICE SET                   ###
########################################

def setDevice(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,EditEID,deviceType,customerID,meterSerialNo,bundleName,installCode,address,createdBy,deviceOwner,deviceManufacturer,marketSegment,GPS_Lat,GPS_Lng):
    expectedResponse = ''
    if commandText == '-- with no updates':
        expectedResponse = '{status: ok, info: Device ' + EditEID + ' modified , command: ' + APIcommand + ', response: ok, newvalues: {...'
    elif commandText == '-- with property updates':
        expectedResponse = '{status: ok, info: Device ' + EditEID + ' modified '
        if deviceType:         expectedResponse = expectedResponse + 'device_type=' + deviceType + ' '
        if customerID:         expectedResponse = expectedResponse + 'customer_id=' + customerID + ' '
        if meterSerialNo:      expectedResponse = expectedResponse + 'meter_serial_no=' + meterSerialNo + ' '
        if bundleName:         expectedResponse = expectedResponse + 'bundle_name=' + bundleName + ' '
        if installCode:        expectedResponse = expectedResponse + 'install_code=' + installCode + ' '
        if address:            expectedResponse = expectedResponse + 'address=' + address + ' '
        if createdBy:          expectedResponse = expectedResponse + 'created_by=' + createdBy + ' '
        if deviceOwner:        expectedResponse = expectedResponse + 'device_owner=' + deviceOwner + ' '
        if deviceManufacturer: expectedResponse = expectedResponse + 'device_manufacturer=' + deviceManufacturer + ' '
        if marketSegment:      expectedResponse = expectedResponse + 'market_segment=' + marketSegment + ' '
        if GPS_Lat:            expectedResponse = expectedResponse + 'gps_lat=' + GPS_Lat + ' '
        if GPS_Lng:            expectedResponse = expectedResponse + 'gps_lng=' + GPS_Lng + ' '
        if gwEID:              expectedResponse = expectedResponse + 'parent_serial=' + gwEID + ' '
        expectedResponse = expectedResponse + ', command: ' + APIcommand + ', response: ok, newvalues: {...'
    elif commandText == '-- with remove Gateway':
        expectedResponse = '{status: ok, info: Device ' + EditEID + ' modified parent_serial=  , command: ' + APIcommand + ', response: ok, newvalues: {gw_eid:  , parent_serial:  }}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(deviceType=deviceType,customerID=customerID,meterSerialNo=meterSerialNo,bundleName=bundleName,eid=devEID,gwEID=gwEID,installCode=installCode,address=address,createdBy=createdBy,deviceOwner=deviceOwner,deviceManufacturer=deviceManufacturer,marketSegment=marketSegment,GPS_Lat=GPS_Lat,GPS_Lng=GPS_Lng)
    reqParams['edit_eid'] = EditEID
    ResponseAPI = processRequest(urlRequest,'setDevice',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])
    
def addDevice(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,installCode,address,deviceOwner,marketSegment,GPS_Lat,GPS_Lng,deviceType,bundleName):
    expectedResponse = ''
    if commandText == '-- with existing device':
        expectedResponse = '{status: Device ' + devEID + ' already exists on gateway ' + gwEID + ', Device: {...'
    elif commandText == '-- with valid session ID' or commandText == '-- with gateway ID':
        expectedResponse = '{command: ' + APIcommand + ', response: ok, eid: ' + devEID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,installCode=installCode,gwEID=gwEID,address=address,deviceOwner=deviceOwner,marketSegment=marketSegment,GPS_Lat=GPS_Lat,GPS_Lng=GPS_Lng,deviceType=deviceType,bundleName=bundleName)
    ResponseAPI = processRequest(urlRequest,'addDevice',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])
    
def addGateway(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,deviceOwner,address,marketSegment,GPS_Lat,GPS_Lng):
    expectedResponse = ''
    if commandText == '-- with existing gateway':
        expectedResponse = '{status: Device ' + gwEID + ' already exists on gateway 0, Device: {...'
    elif commandText == '-- with valid session ID':
        expectedResponse = '{command: ' + APIcommand + ', response: ok, eid: ' + gwEID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=gwEID,deviceOwner=deviceOwner,address=address,marketSegment=marketSegment,GPS_Lat=GPS_Lat,GPS_Lng=GPS_Lng)
    ResponseAPI = processRequest(urlRequest,'addGateway',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])
    
def deviceRemoveApp(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid session ID':
        expectedResponse = '{command: deviceRemoveApp, response: ok, eid: ' + devEID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID)
    ResponseAPI = processRequest(urlRequest,'deviceRemoveApp',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])
    
def removeDevice(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- for Gateway with devs':
        expectedResponse = '{status: This gateway has meters attached, please remove all meters for this gateway first., command: removeDevice, response: Error}'
    elif commandText == '-- for meter device' or commandText == '-- for Gateway':
        expectedResponse = '{status: ' + devEID + ' Device has been removed from database permanently, command: removeDevice, response: ok}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID)
    ResponseAPI = processRequest(urlRequest,'removeDevice',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   3 DEVICE GET                   ###
########################################

def getDeviceInfo(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,segment,columns,owner,type,qtype,query,sortname,sortorder,rp,page,limit):
    expectedResponse = ''
    if commandText == '-- with existing device':
        expectedResponse = 'All info for device ' + devEID + ' will be returned'
    elif commandText == '-- with Owner':
        expectedResponse = 'All devices with owner = ' + owner + ' will be returned'
    elif commandText == '-- with invalid Owner':
        expectedResponse = '{response: Error}'
    elif commandText == '-- with existing gateway':
        expectedResponse = 'All info for devices belonging to Gateway ' + gwEID + ' will be returned'
    elif commandText == '-- with invalid gateway':
        expectedResponse = '{response: Error}'
    elif commandText == '-- with QType':
        expectedResponse = 'ALL devices using a query of ' + qtype + ' = ' + query
    elif commandText == '-- with RP':
        expectedResponse = 'Devices that are found using a query of ' + qtype + ' = ' + query + ' with rp set to '+ rp + ' and page set to ' + page
    elif commandText == '-- with Limit and Columns':
        expectedResponse = 'Devices that are found with all search options blank and columns set to (' + columns + ') with limit set to ' + limit
    elif commandText == '-- with valid Type':
        expectedResponse = 'Devices that are found with a device_type = ' + type
    elif commandText == '-- with invalid Type':
        expectedResponse = '{response: Error}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,gwEID=gwEID,segment=segment,columns=columns,owner=owner,type=type,qtype=qtype,query=query,sortname=sortname,sortorder=sortorder,rp=rp,page=page,limit=limit)
    ResponseAPI = processRequest(urlRequest,'getDeviceInfo',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getDeviceMember(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,member):
    expectedResponse = ''
    if commandText == '-- with existing device':
        expectedResponse = 'All device members for meter ' + devEID
    elif commandText == '-- with existing gateway':
        expectedResponse = 'All device members for gateway ' + devEID
    elif commandText == '-- with valid member type':
        expectedResponse = '{member: ' + member + ', command: getDeviceMember, eid: ' + devEID + ', value: .....}'
    elif commandText == '-- with invalid member':
        expectedResponse = '{member: ' + member + ', command: getDeviceMember, eid: ' + devEID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,member=member)
    ResponseAPI = processRequest(urlRequest,'getDeviceMember',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getMeterByEid(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with existing device':
        expectedResponse = 'All device members for eid ' + devEID
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID)
    ResponseAPI = processRequest(urlRequest,'getMeterByEid',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   4 APP ADMIN                    ###
########################################

#def uploadApplication(commandText,fileName,appType,displayName):
#    return(expectedResponse)

def getBundleDetails(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID,type):
    expectedResponse = ''
    if commandText == '-- with blank bundle ID and type':
        expectedResponse = 'The following bundle details were found'
    elif commandText == '-- with type not found':
        expectedResponse = '{status: The bundle could not be found based on your inputs, command: getBundleDetails, response: error}'
    elif commandText == '-- with valid bundle ID':
        expectedResponse = 'Found the following details for ' + bundleID
    elif commandText == '-- with type ' + type:
        expectedResponse = 'Found the following ' + type + ' bundles'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(bundleID=bundleID,type=type)
    BuiltIn().log_to_console("\reqParams -- "+str(reqParams))
    ResponseAPI = processRequest(urlRequest,'getBundleDetails',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def editApp(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID,appName,owner,displayName,role,industry,comment):
    expectedResponse = ''
    if commandText == '-- with blank bundle ID and appName':
        expectedResponse = '{command: editApp, response: error, error: bundle_id is not defined or undefined}'
    elif commandText == '-- with invalid appName' or commandText == '-- with appName not found':
        expectedResponse = '{command: editApp, response: error, error: ' + appName + ' bundle_name is not found in the applications list}'
    elif commandText == '-- with bundle ID and displayName' or commandText == '-- with bundle ID and role' or commandText == '-- with bundle ID and comment' \
        or commandText == '-- with appNme and owner' or commandText == '-- with appNme and industry':
        expectedResponse = 'Contains the following -- message: (Rows matched: 1  Changed: 1  Warnings: 0)'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(bundleID=bundleID,appName=appName,owner=owner,displayName=displayName,role=role,industry=industry,comment=comment)
    ResponseAPI = processRequest(urlRequest,'editApp',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def deleteApp(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID):
    expectedResponse = ''
    if  commandText == '-- with valid bundleID':
        expectedResponse = '{deleted: ' + bundleID + ', command: deleteApp, response: ok, result: ........}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(bundleID=bundleID)
    ResponseAPI = processRequest(urlRequest,'deleteApp',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   5 DEVICE CONTROL               ###
########################################

def gatewayActivateDevice(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,installCode):
    expectedResponse = ''
    if commandText == '-- with valid details':
        expectedResponse = '{sent_at: xxxxxxxxxxxxx, cid: xxx, command: gatewayActivateDevice, eid: ' + gwEID + ', response: ok, name: ACTIVATE_DEVICE}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,eid=devEID,installCode=installCode)
    ResponseAPI = processRequest(urlRequest,'gatewayActivateDevice',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def gatewayDeleteBundle(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID,bundleName):
    expectedResponse = ''
    if commandText == '-- with blank bundle ID & Name':
        expectedResponse = '{status: Missing required parameter bundle_name or bundle_id is needed, command: gatewayDeleteBundle, response: error}'
    elif commandText == '-- with dev bundle ID' or commandText == '-- with dev bundle Name' or commandText == '-- with app bundle ID' or commandText == '-- with app bundle Name':
        expectedResponse = 'Contains --> command: gatewayDeleteBundle, response: ok, name: DELETE_BUNDLE'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,bundleID=bundleID,bundleName=bundleName)
    ResponseAPI = processRequest(urlRequest,'gatewayDeleteBundle',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def gatewayDeleteDevice(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid details':
        expectedResponse = 'Contains --> command: gatewayDeleteDevice, eid: ' + devEID + ', response: ok, name: DEVICE_LEAVE'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,eid=devEID)
    ResponseAPI = processRequest(urlRequest,'gatewayDeleteDevice',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   6 APP CONTROL                  ###
########################################

def deviceSendCommand(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,name,params):
    expectedResponse = ''
    if commandText == '-- with blank name':
        expectedResponse = '{command: deviceSendCommand, response: no command supplied from these posted args params,eid,clientName, eid: ' + devEID + '}'
    elif commandText == '-- with blank device & name':
        expectedResponse = '{command: deviceSendCommand, response: no command supplied from these posted args clientName}'
    elif commandText == '-- with get command details':
        expectedResponse = '{sent_at: xxxxxxxxxxxxx, cid: xxx, name: ' + name + ', command: deviceSendCommand, app_eid: xxxxxxxxxxxx, response: ok, eid: ' + devEID + '}'
    elif commandText == '-- with set command blank params':
        expectedResponse = '{sent_at: xxxxxxxxxxxxx, cid: xxx, name: ' + name + ', command: deviceSendCommand, app_eid: xxxxxxxxxxxx, response: ok, eid: ' + devEID + '}'
    elif commandText == '-- with set command params':
        expectedResponse = '{sent_at: xxxxxxxxxxxxx, cid: xxx, name: ' + name + ', command: deviceSendCommand, app_eid: xxxxxxxxxxxx, response: ok, eid: ' + devEID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,name=name,params=params)
    ResponseAPI = processRequest(urlRequest,'deviceSendCommand',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getApplicationCmds(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID):
    expectedResponse = ''
    if commandText == '-- with blank device & bundle':
        expectedResponse = '{command: getApplicationCmds, response: No bundle_id supplied or eid supplied}'
    elif commandText == '-- with blank device':
        expectedResponse = 'Contains the list of commands found in ' + bundleID
    elif commandText == '-- with blank bundle':
        expectedResponse = 'Contains the list of commands found for device ' + devEID
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,bundleID=bundleID)
    ResponseAPI = processRequest(urlRequest,'getApplicationCmds',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   7 EVENT LOGS                   ###
########################################

def getAlert(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,after,before,owner,qtype,query,sortname,sortorder,rp,page,limit):
    expectedResponse = ''
    BuiltIn().log_to_console('\nAPIcommand is: ' +APIcommand+ '\ncommandText is: ' +commandText+ '\ndevEID is: '+devEID)
    if commandText == '-- with blank device':
        expectedResponse = 'Would return ALL alerts, limit set to ' + limit
    elif commandText == '-- with device eid':
        expectedResponse = 'Returns all alerts for device ' + devEID
    elif commandText == '-- with gateway eid':
        expectedResponse = 'Returns all alerts for gateway ' + devEID
    elif commandText == '-- with owner':
        expectedResponse = 'Returns all alerts for owner ' + owner
    elif commandText == '-- with device command':
        expectedResponse = 'Returns all alerts for command ' + query
    elif commandText == '-- with qtype, query & after':
        expectedResponse = 'Returns all alerts for qType ' + qtype + ', with query = ' + query + ' and after = ' + after
    elif commandText == '-- with rp':
        expectedResponse = 'Returns alerts with rp set to ' + rp
    elif commandText == '-- with limit':
        expectedResponse = 'Returns alerts with limit set to ' + limit
    elif commandText == '-- with a Multivalue' or commandText == '-- with b Multivalue' or commandText == '-- with c Multivalue':
        expectedResponse = 'Returns alerts for type/column ' + qtype + ', where the values can be ' + query
    elif commandText == '-- with d Ranges' or commandText == '-- with e Ranges':
        expectedResponse = 'Returns alerts where qType is ' + qtype + ' and query is ' + query
    elif commandText == '-- with f Multicolumn' or commandText == '-- with g Multicolumn':
        expectedResponse = 'Returns alert records using qType set to ' + qtype + ' and query set to ' + query 
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,after=after,before=before,owner=owner,qtype=qtype,query=query,sortname=sortname,sortorder=sortorder,rp=rp,page=page,limit=limit)
    ResponseAPI = processRequest(urlRequest,'getAlert',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getTransactions(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,after,before,owner,type,qtype,query,sortname,sortorder,rp,page):
    expectedResponse = ''
    if commandText == '-- with blank device':
        expectedResponse = 'Would return ALL transactions'
    elif commandText == '-- with device eid':
        expectedResponse = 'Returns all transactions for device ' + devEID
    elif commandText == '-- with gateway eid':
        expectedResponse = 'Returns all transactions for gateway ' + devEID
    elif commandText == '-- with device command':
        expectedResponse = 'Returns all transactions for command ' + query
    elif commandText == '-- with qtype, query & after':
        expectedResponse = 'Returns all transactions for qType ' + qtype + ' query = ' + query + ' and after = ' + after
    elif commandText == '-- with rp & page':
        expectedResponse = 'Returns transactions with rp set to ' + rp + ' and page set to ' + page
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=devEID,after=after,before=before,owner=owner,type=type,qtype=qtype,query=query,sortname=sortname,sortorder=sortorder,rp=rp,page=page)
    ResponseAPI = processRequest(urlRequest,'getTransactions',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getTransactionsCSV(urlRequest,sessionID,eid,after,before,owner,type,qtype,query,sortname,sortorder,rp,page):
    reqParams        = setParams(eid=eid,after=after,before=before,owner=owner,type=type,qtype=qtype,query=query,sortname=sortname,sortorder=sortorder,rp=rp,page=page)
    reqParams['csv'] = 1
    cookie           = {"sessionid":sessionID}
    requestAPI       = urlRequest + '/getTransactions'
    r=requests.get(url=requestAPI,cookies=cookie,params=reqParams)
    csvData          = str(r.text)
    retCommand       = 'getTransactions (CSV)'
    recCount         = (len(csvData.splitlines()))-1  # -1 to account for csv header
    return(retCommand,recCount,csvData)

########################################
###   8 SOFTWARE UPDATE              ###
########################################

def transferBundleToDevice(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID):
    expectedResponse = ''
    if  commandText == '-- with valid GW & Bundle':
        expectedResponse = '{command: transferBundleToDevice, response: ok, gateway_eid: ' + devEID + ', bundle_id: ' + bundleID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(eid=gwEID,bundleID=bundleID)
    ResponseAPI = processRequest(urlRequest,'transferBundleToDevice',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def getTransferStatus(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid session ID':
        expectedResponse = 'transfer status of all transfers (active and completed)'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    ResponseAPI = processRequest(urlRequest,'getTransferStatus',sessionID)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

########################################
###   9 OTA DEVICE FIRMWARE UPDATE   ###
########################################

def activateOTAApp(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid gateway':
        expectedResponse = '{sent_at: xxxxxxxxxxxxx, cid: xxx, gw_eid: ' + gwEID + ', command: activateOTAApp, eid: ffffffffffffffff, response: ok, name: APP_UPDATE}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = {'gw_eid':gwEID}
    ResponseAPI = processRequest(urlRequest,'activateOTAApp',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def deactivateOTAApp(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID):
    expectedResponse = ''
    if commandText == '-- with valid gateway':
        expectedResponse = '{sent_at: xxxxxxxxxxxxx, cid: xxx, gw_eid: ' + gwEID + ', command: deactivateOTAApp, eid: ffffffffffffffff, response: ok, name: DEVICE_LEAVE}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = {'gw_eid':gwEID}
    ResponseAPI = processRequest(urlRequest,'deactivateOTAApp',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def addOTABundle(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID,bundleName):
    expectedResponse = ''
    if  commandText == '-- with valid GW & Bundle':
        expectedResponse = '{status: {sent_at: xxxxxxxxxxxxx, cid: xxx, response: ok, eid: ' + gwEID + ', name: SEND_TO_APP}, command: addOTABundle}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,bundleID=bundleID,bundleName=bundleName)
    ResponseAPI = processRequest(urlRequest,'addOTABundle',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def delOTABundle(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,bundleID):
    expectedResponse = ''
    if  commandText == '-- with valid GW & Bundle':
        expectedResponse = '{status: {sent_at: xxxxxxxxxxxxx, cid: xxx, response: ok, eid: ' + gwEID + ', name: SEND_TO_APP}, command: delOTABundle}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,bundleID=bundleID)
    ResponseAPI = processRequest(urlRequest,'delOTABundle',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def addOTAEvent(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,eventID,bundleID,startTime,guardTime,activateTime,policy,deviceList):
    expectedResponse = ''
    if   commandText == '-- with invalid event ID':
        expectedResponse = '{command: addOTAEvent, response: Error: event_id needs to be a number}'
    elif commandText == '-- with blank event ID':
        expectedResponse = '{command: addOTAEvent, response: Missing required parameter event_id is needed}'
    elif commandText == '-- with invalid start time':
        expectedResponse = '{command: addOTAEvent, response: Error: start_time needs to be a number}'
    elif commandText == '-- with invalid guard time':
        expectedResponse = '{command: addOTAEvent, response: Error: guard_time needs to be a number}'
    elif commandText == '-- with blank guard time':
        expectedResponse = '{command: addOTAEvent, response: Missing required parameter guard_time is needed}'
    elif commandText == '-- with invalid activate time':
        expectedResponse = '{command: addOTAEvent, response: Error: activate_time needs to be a number}'
    elif commandText == '-- with activate < start time':
        expectedResponse = '{command: addOTAEvent, response: Error: Event times do not conform to specification. Make sure activate_time equals 0 or greater than (start_time + guard_time) &  start_time equals zero or greater than current time}'
    elif commandText == '-- with invalid policy':        
        expectedResponse = '{command: addOTAEvent, response: policy Must be OTA_POLICY_FORCE}'
    elif commandText == '-- with blank policy':
        expectedResponse = '{command: addOTAEvent, response: Missing required parameter policy is needed}'
    elif commandText == '-- with valid values':
        expectedResponse = '{command: addOTAEvent, response: ok, name: SEND_TO_APP, eid: ' + gwEID + '}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,eventID=eventID,bundleID=bundleID,startTime=startTime,guardTime=guardTime,activateTime=activateTime,policy=policy,deviceList=deviceList)
    ResponseAPI = processRequest(urlRequest,'addOTAEvent',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])

def delOTAEvent(urlRequest,sessionID,APIcommand,commandText,urlReturned,devEID,gwEID,eventID):
    expectedResponse = ''
    if  commandText == '-- with invalid event ID':
        expectedResponse = '{command: delOTAEvent, response: Error: event_id needs to be a number}'
    elif commandText == '-- with blank event ID':
        expectedResponse = '{command: delOTAEvent, response: Missing required parameter event_id is needed}'
    elif commandText == '-- with valid GW & Event':
        expectedResponse = '{status: {sent_at: xxxxxxxxxxxxx, cid: xxx, response: ok, eid: ' + gwEID + ', name: SEND_TO_APP}, command: delOTAEvent}'
    else:
        expectedResponse = commonErrors(APIcommand,commandText,urlReturned,devEID,gwEID)
    reqParams   = setParams(gwEID=gwEID,eventID=eventID)
    ResponseAPI = processRequest(urlRequest,'delOTAEvent',sessionID,reqParams)
    return(expectedResponse,ResponseAPI[0],ResponseAPI[1],ResponseAPI[2])