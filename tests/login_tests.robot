*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/keywords/login_keywords.robot
Resource          ../variables/global_variables.robot
Documentation    Tags in Robot Framework

*** Variables ***
${SITE_URL}      https://dmate.dmate.it/
${LOGIN_PAGE}    https://dmate.dmate.it/INTERSHOP/web/WFS/6662001970-6662001970WS-Site/it_IT/-/EUR/ViewUserAccount-ProcessLogin

*** Test Cases ***

Invalid Login Test
    [Tags]    all    login    regression
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Input Username And Password    invalid_user    invalid_pass
    Click Login Button
    Verify Login Failed
    Close Browser


Valid Login Test
    [Tags]    all    login    smoke    regression
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Input Username And Password    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click Login Button
    Verify Successful Login
    Logout
    Close Browser

Validate Forgot Password Page
    [Tags]    all    smoke
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Maximize Browser Window
    Click Accept Cookies
    Click Forgot Password
    Validate Forgot Password Page
    Close Browser