*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${ACCEDI}    //span[contains(text(),'Accedi')]
${INPUT_USERNAME}    //div[@class='col-md-6']//input[@id='ShopLoginForm_Login']
${INPUT_PASSWORD}    //div[@class='col-md-6']//input[@id='ShopLoginForm_Password']
${BUTTON_LOGIN}    css:div[class='col-md-offset-3 col-md-9'] button[name='login']
${MYACCOUNT}    //span[normalize-space()='Il mio account']
${LOGOUT}    css:.my-account-logout
${FORGOT_PASSWORD}    xpath:(//*[@class="btn btn-link forgot-pwd"])[2]
${FORGOT_PASSWORD_TEXT}    //h1[normalize-space()='Password dimenticata?']
${FORGOT_PASSWORD_SECONDTEXT}    //p[contains(text(),'Inserisci il tuo nome utente e riceverai un’email,')]
${INVALID_LOGIN_ALERT}    css:div[role='alert']

*** Keywords ***


Click Accept Cookies
    Wait Until Element Is Visible    id:onetrust-accept-btn-handler    timeout=10s
    Click Button    id:onetrust-accept-btn-handler

Open Login Popup
    Sleep    5s
    Click Element    ${ACCEDI} 
    

Input Username And Password
    Sleep    5s
    [Arguments]    ${username}    ${password}
    Input Text    ${INPUT_USERNAME}    ${username}
    Input Text    ${INPUT_PASSWORD}    ${password}

Click Login Button
    Click Element    ${BUTTON_LOGIN}

Verify Successful Login
    Element Should Be Visible    ${MYACCOUNT}

Logout
    Click Element    ${MYACCOUNT}
    Wait Until Element Is Visible    ${LOGOUT}    5s
    Click Element    ${LOGOUT}

Verify Login Failed
    Wait Until Element Is Visible    ${INVALID_LOGIN_ALERT}    5s
    Element Should Be Visible    ${INVALID_LOGIN_ALERT}

Click Forgot Password
    Sleep    3s
    Wait Until Element Is Visible    ${FORGOT_PASSWORD}
    Click Element    ${FORGOT_PASSWORD}

Validate Forgot Password Page
    Element Should Be Visible    ${FORGOT_PASSWORD_TEXT} 
    Element Should Be Visible    ${FORGOT_PASSWORD_SECONDTEXT}
