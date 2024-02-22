*** Settings ***
Library    String
Library    Collections
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}               https://employee.1kapper.nl/login
${Browser}           Chrome
${Username}          luc5429-3
${Password}          @kap4848

${XPath_No_Items}        //*[@id="main"]/div[3]/div[5]/table/tbody/tr/td
${XPath_head}            //*[@id="main"]/div[3]/div[5]/table/thead
${XPath_Item_1}          //*[@id="main"]/div[3]/div[5]/table/tbody/tr[1]
${XPath_Item_2}          //*[@id="main"]/div[3]/div[5]/table/tbody/tr[2]/td/input
${XPath_Item_3b}         //*[@id="main"]/div[3]/div[5]/table/tbody/tr

${list_Path}         C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\logboek_klanten_2.txt     # Replace with path to your links file
${Download_Path}     C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\Kleurenkaart     # Replace with path to your download directory

*** Test Cases ***
Download Files from URLs
    ${File}=    Get File  ${list_Path}
    @{urls}=    Split to lines  ${File}

    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=username    ${Username}
    Input Password    id=password    ${Password}
    Click Button    xpath=//*[@id="app"]/div[2]/div/div/div/div/form/div[4]/button
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[3]/a

    FOR    ${url}    IN    @{urls}
        Log    Navigating to URL: ${url}/color-charts
        Go To    ${url}/color-charts
        
        Wait Until Page Contains Element    xpath=//*[@id="overview-filter-form"]/form/div/div/div/span/span[1]/span
        ${full_name} =    Get Text    xpath=//*[@id="overview-filter-form"]/form/div/div/div/span/span[1]/span
        ${file_name}=    Reverse Names    ${full_name}
        ${file_path} =    Join Path    ${Download_Path}    ${file_name}.txt

        ${file_name}=    Reverse Names    ${full_name}
        
        ${no_items} =    Get Text    xpath=${XPath_No_Items}
        Run Keyword Unless    '${no_items}' == 'Geen items'    Copy Kleuren Kaart    ${file_path}

        Log    Navigating to URL: ${url}/permanent-cards
        Go To    ${url}/permanent-cards
        ${no_items} =    Get Text    xpath=${XPath_No_Items}
        Run Keyword Unless    '${no_items}' == 'Geen items'    Copy Permanenten Kaart    ${file_path}
    END

*** Keywords ***
Reverse Names
    [Arguments]    ${name}
    ${reversed_name}=    Set Variable    ${name}
    ${status}=    Run Keyword And Return Status    Split Name    ${name}
    Run Keyword If    '${status}' == 'PASS'
    ...    ${reversed_name}=    Run Keyword And Return Status    Evaluate    "${name.split()[1]} ${name.split()[0]}"
    [Return]    ${reversed_name}

Split Name
    [Arguments]    ${name}
    ${status}=    Run Keyword And Return Status    Split String    ${name}    ${SPACE}
    Run Keyword If    '${status}' == 'FAIL'
    ...    Fail    Unable to split name: ${name}
    [Return]    ${status}

Copy Kleuren Kaart
    [Arguments]    ${file_path}
    Append To File    ${file_path}    -------Kleuren Kaart--------\n
    
    ${headers}=    Get Text    xpath=${XPath_head}
    Append To File    ${file_path}    ${headers}\n

    ${content}=    Get Text    xpath=${XPath_Item_1}
    Append To File    ${file_path}    ${content}\n

    ${value} =    Get Value    xpath=${XPath_Item_2}
    Append To File    ${file_path}    ${value}\n

Copy Permanenten Kaart
    [Arguments]    ${file_path}
    Append To File    ${file_path}    -------Permanenten Kaart--------\n
    
    ${content}=    Get Text    xpath=${XPath_head}
    Append To File    ${file_path}    ${content}\n

    ${content}=    Get Text    xpath=${XPath_Item_1}
    Append To File    ${file_path}    ${content}\n