# *** Settings ***
# Resource    ../../Resources/variables.robot
# Resource    ../../Resources/keywords.robot
# Resource    ./environment.robot
# Library     LoraLibrary

# *** Variables ***
# ${cmd}        GET_NIC_TIME

# *** Test Cases ***
# Validate Command GET_NIC_TIME
#     Select GateWay      ${gw}
#     Send Out Command To EID    ${eid}    ${cmd}
#     Wait And Validate Response Of Command    ${eid}    ${cmd}    ${FW_VER}
