*** Variables ***
${urlSauce}  https://www.saucedemo.com
${username}  standard_user
${password}  secret_sauce

#opdracht 1, 2
${locatorUsername}  id=user-name
${locatorPassword}  id=password

#opdracht 4
${urlNaarKeuze}    https://www.github.com/

*** Settings ***
Library    Browser

*** Test Cases ***
#opdracht 1, 2
Selecteer een product en voeg deze toe aan het winkelmandje
    [Documentation]    Locator test
    [Tags]    locators
    Open Pagina ${urlSauce}
    Login
    Selecteer product
    Sleep    10

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
    Click   xpath=//*[@id="item_5_title_link"]/div
    Click   xpath=//*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Click   xpath=//*[@id="shopping_cart_container"]
    Click   xpath=//*[@id="checkout"]



