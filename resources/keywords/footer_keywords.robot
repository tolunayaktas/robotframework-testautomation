*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${ACCEDI}    //span[contains(text(),'Accedi')]
${BUTTON_CONTACTUS}    css:a[href='https://dmate.dmate.it/ilmionegozio']
${TITLE_CONTACTUS}    //h3[normalize-space()='Chi siamo']
${TEXT_CONTACTUS}    css:#kontaktformular-titel
${COOKIE_SETTINGS}    css:.optanon-show-settings
${FIRST_COOKIE}    css:label[for='ot-group-id-2'] span[role='switch']
${SECOND_COOKIE}    css:label[for='ot-group-id-3'] span[role='switch']
${ACCEPT_MYSETTINGS}    css:.save-preference-btn-handler.onetrust-close-btn-handler

*** Keywords ***

Go To Contact Us
    Press Keys    xpath=//body    END
    Wait Until Element Is Visible    ${BUTTON_CONTACTUS}
    Click Element    ${BUTTON_CONTACTUS}
    
Validate Contact Us Page
    Wait Until Element Is Visible    ${TITLE_CONTACTUS}
    Element Should Be Visible    ${TITLE_CONTACTUS}
    Wait Until Element Is Visible    ${TEXT_CONTACTUS}
    Element Should Be Visible    ${TEXT_CONTACTUS}

Open Cookies Settings
    Press Keys    xpath=//body    END
    Wait Until Element Is Visible    ${COOKIE_SETTINGS}
    Click Element    ${COOKIE_SETTINGS}

Control Cookies Settings Functions
    Wait Until Element Is Visible    ${FIRST_COOKIE}
    Click Element    ${FIRST_COOKIE}
    Sleep    4s
    ${CHECKBOX_FIRSTCOOKIE}    Get Element Attribute    ${FIRST_COOKIE}    aria-checked
    Should Be Equal As Strings    ${CHECKBOX_FIRSTCOOKIE}    false

    #Execute JavaScript    arguments[0].scrollIntoView();    ${SECOND_COOKIE}
    Execute JavaScript    window.scrollBy(0, 200);

    Wait Until Element Is Visible    ${SECOND_COOKIE}
    Click Element    ${SECOND_COOKIE}
    Sleep    4s
    ${CHECKBOX_SECONDCOOKIE}    Get Element Attribute    ${SECOND_COOKIE}    aria-checked
    Should Be Equal As Strings    ${CHECKBOX_SECONDCOOKIE}    false

    Click Element    ${ACCEPT_MYSETTINGS}
