*** Settings ***
# Resource    ../../Resources/variables.robot
# Resource    ../../Resources/keywords.robot
Library    SSHLibrary
# Library     ../../Resources/validationLib.py
Suite Setup    Open Connection And Log In
Suite Teardown    Close All Connections

*** Variables ***
${HOST}    10.10.10.125
${USERNAME}    freestyle
${PASSWORD}    freestyle

*** Test Cases ***
Execute Command And Verify Output
    [Documentation]    Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    Write    cd ./robotframework/Project
    ${output}    Read
    Write    pwd
    ${output1}    Read
    ${output2}    Execute Command
    Log To Console    out0 = ${output}
    Log To Console    out1 = ${output1}
    Log To Console    out2 = ${output2}


Execute Command And Verify Return Code
    [Documentation]    Often getting the return code of the command is enough.
    ...                This behaviour can be adjusted as Execute Command arguments.
    ${rc}=    Execute Command    echo Success guaranteed.    return_stdout=False    return_rc=True
    Should Be Equal    ${rc}    ${0}
    Log To Console    ${rc}

Executing Commands In An Interactive Session
    [Documentation]    Execute Command always executes the command in a new shell.
    ...                This means that changes to the environment are not persisted
    ...                between subsequent Execute Command keyword calls.
    ...                Write and Read Until variants can be used to operate in the same shell.
    Write    cd ..
    Write    echo Hello from the parent directory!
    ${output}=    Read Until    directory!
    Should End With     ${output}    Hello from the parent directory!

*** Keywords ***
Open Connection And Log In
   Open Connection    ${HOST}
   Login    ${USERNAME}    ${PASSWORD}