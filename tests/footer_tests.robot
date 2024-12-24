*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/keywords/common_keywords.robot
Resource          ../resources/keywords/home_keywords.robot
Resource          ../resources/keywords/footer_keywords.robot
Resource          ../variables/global_variables.robot
Resource          ../resources/keywords/login_keywords.robot
Documentation    Tags in Robot Framework


*** Test Cases ***

Contact Us Page Validation
    [Tags]    all    footer    regression
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Go To Contact Us
    Validate Contact Us Page
    Close Browser

Control Cookie Settings Functions
    [Tags]    all    footer    regression
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Open Cookies Settings
    Control Cookies Settings Functions
    Close Browser