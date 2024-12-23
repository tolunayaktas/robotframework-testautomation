*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/global_variables.robot

*** Variables ***
${ACCEDI}    //span[contains(text(),'Accedi')]
${LOGO}      css:img[class='remove-on-error']
${CARELLO}    //span[normalize-space()='Carrello']
${CARELLO_ALERT}    //div[contains(text(),'Effettua il login per utilizzare il negozio.')]
${INPUT_SEARCH}    css:input[placeholder='Codice articolo, Parola chiave']
${BUTTON_SEARCH}    css:.glyphicon.glyphicon-search
${FIRST_PRODUCT}    (//span[@itemprop='name'])[1]

*** Keywords ***

Validate Home Page Logo 
    Wait Until Element Is Visible    ${LOGO}

Click Carello Button
    Click Element    ${CARELLO}

Validate Carello Requires SignIn
    Wait Until Element Is Visible    ${CARELLO_ALERT}

Search a Product ${PRODUCT_NAME}
    Input Text    ${INPUT_SEARCH}    ${PRODUCT_NAME}
    Click Element    ${BUTTON_SEARCH}

Verify If the Product is Listed
    ${FIRST_PRODUCT_TEXT} =    Get Text    ${FIRST_PRODUCT}
    Should Contain    ${FIRST_PRODUCT_TEXT}    ${PRODUCT_NAME}    
    