*** Settings ***
Resource    ../../Resources/variables.robot
Resource    ../../Resources/keywords.robot
Library    Collections
Library    ../../Resources/mylibrary.py

*** Variables ***
@{all}    0001    0002    0003
@{all2}        7ff9011020000095    7ff9011020000096    7ff9011020000097
...               7ff9011020000098    7ff9011020000099    7ff9011020000100
...               7ff9011020000085    7ff9011020000086    7ff9011020000087




*** Test Cases ***
Create Dictionary Test
    Log to console    hello wolrd




