*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library     ../../Resources/mylibs.py
# Suite Setup    FMS Login
# Suite Teardown    Close Browser
Suite Setup    Log To Console    This is setting's suite setup
Suite Teardown    Log To Console    This is setting's suite teardown
Test Setup    Log To Console    This is setting's test setup
Test TearDown    Log To Console    This is setting's test teardown

Documentation    An example test suite documentation with *some* _formatting_.
...              See test documentation for more documentation examples.
Metadata    Version        2.0
Metadata    More Info      For more information about *Robot Framework* see http://robotframework.org
Metadata    Executed At    ${FMS_URL}