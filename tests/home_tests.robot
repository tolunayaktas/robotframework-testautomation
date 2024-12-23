*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/keywords/login_keywords.robot
Resource          ../resources/keywords/home_keywords.robot
Resource          ../variables/global_variables.robot
Documentation    Tags in Robot Framework

*** Test Cases ***

Home Page Logo Validation
    [Tags]    all, home, regression
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Validate Home Page Logo
    Close Browser

Validate Carello Function That Require Signin    
    [Tags]    all, home, regression 
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Click Carello Button
    Validate Carello Requires SignIn
    Close Browser

Searching an Item With Title
    [Tags]    all, home, regression
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Search a Product ${PRODUCT_NAME}
    Verify If the Product is Listed
    Close Browser