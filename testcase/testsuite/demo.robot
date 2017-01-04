
*** Test Cases ***
# Demo1
#     TestLib2


# *** Keywords ***
# TestLib
#     ${x}    hello    helloworld
#     Log to console    ${x}

# testLib2
#     ${x}    My Hello World     helloworld
#     Log to console    ${x}

# Demo1
#     [Documentation]    Simple documentation
#     [Setup]    Log To Console    This is demo1's test setup
#     Should Be Equal    42    42    *HTML* Number is not my <b>MAGIC</b> number.
#     [Teardown]    Log To Console    This is demo1's test teardwon

# Demo2
#     [Documentation]    *This is bold*, _this is italic_  and here is a link: http://robotframework.org
#     [Setup]    Log To Console    This is demo2's test setup
#     Should Be Equal    42    42    *HTML* Number is not my <b>MAGIC</b> number.
#     [Teardown]    Log To Console    This is demo2's test teardwon

# Demo3
#     [Documentation]    This documentation    is split    into multiple columns
#     [Setup]    Log To Console    This is demo3's test setup
#     Should Be Equal    42    42    *HTML* Number is not my <b>MAGIC</b> number.
#     [Teardown]    Log To Console    This is demo3's test teardwon

# Demo1
#     [template]    Example
#     hello    World
#     Nothing    Possible
#     Allo       Ha

Demo1
    [template]    Example for embeded ${first} add ${second} equals
    hello    World
    Nothing    Possible
    Allo       Ha


*** Keywords ***
Example
    [arguments]    ${arg1}    ${arg2}
    Log to console    [${arg1}] add [${arg2}] equels nothings

Example for embeded ${first} add ${second} equals
    Log to console    ${first} add ${second}



