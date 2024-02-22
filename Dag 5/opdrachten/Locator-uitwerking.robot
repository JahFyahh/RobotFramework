*** Variables ***
${urlSauce}  https://www.saucedemo.com
${username}  standard_user
${password}  secret_sauce

#opdracht 1, 2
${locatorUsername}  .login-box > form > div:nth-child(1) > input
${locatorPassword}  .login-box > form > div:nth-child(2) > input

#opdracht 4
${urlNaarKeuze}    https://www.youtube.com

*** Settings ***
Library    Browser

*** Test Cases ***
Selecteer een product en voeg deze toe aan het winkelmandje
    [Documentation]    Locator test
    [Tags]    locators
    Open Pagina ${urlSauce}
    Login
    Selecteer product Sauce Labs Bolt T-Shirt
    Sleep    3

# Opdracht 4
Openbrowser naar keuze
    Open Pagina ${urlNaarKeuze}
    Click  //*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[2]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
    Fill Text    //*[@id="search"]    test

*** Keywords ***
Open Pagina ${url}
    New Browser    chromium    headless=false
    New Page       ${url}
    
Login
    Fill Text    ${locatorUsername}	 ${username}
    Fill Text	 ${locatorPassword}  ${password}  
    Click    data-test=login-button

#opdracht 3
Selecteer product ${product}
    Click    .inventory_item:has-text("${product}") >> button