*** Variables ***
${urlSauce}  https://www.saucedemo.com
${username}  standard_user
${password}  secret_sauce

#opdracht 1, 2
${locatorUsername}  ...
${locatorPassword}  ...

#opdracht 4
${urlNaarKeuze}    https://uwv.nl

*** Settings ***
Library    Browser

*** Test Cases ***
#opdracht 1, 2
Selecteer een product en voeg deze toe aan het winkelmandje
    [Documentation]    Locator test
    [Tags]    locators
    Open Pagina ${urlSauce}
    Login
    # Selecteer product
    Sleep    3

#opdracht 4
Openbrowser naar keuze
    Open Pagina ${urlNaarKeuze}



*** Keywords ***
Open Pagina ${url}
    New Browser    chromium    headless=false
    New Page       ${url}
    
Login
    Fill Text    ${locatorUsername}	 ${username}
    Fill Text	 ${locatorPassword}  ${password}  
    Click    data-test=login-button


#opdracht 3
Selecteer product
    Click    ...

