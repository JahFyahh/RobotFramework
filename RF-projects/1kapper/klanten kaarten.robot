*** Settings ***
Library    String
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}               https://employee.1kapper.nl/login
${Browser}           Chrome
${Username}          luc5429-3
${Password}          
${File_Path}         C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\id_links.txt     # Replace with path to your links file
${Download_Path}     C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\Kleurenkaart     # Replace with path to your download directory

*** Test Cases ***
Download Files from URLs
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=username    ${Username}
    Input Password    id=password    ${Password}
    Click Button    xpath=//*[@id="app"]/div[2]/div/div/div/div/form/div[4]/button
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[3]/a
    ${File}=    Get File  ${File_Path}
    @{urls}=    Split to lines  ${File} 
    FOR    ${url}    IN    @{urls}
        Go To    ${url}
        Download file    xpath=//*[@id="main"]/div[4]/div/div/div/div[4]/div/form/button
        Download file    xpath=//*[@id="main"]/div[4]/div/div/div/div[5]/div/form/button
    END

*** Keywords ***
Read URLs From File
    [Arguments]    ${file_path}
    ${lines}=    Get File    ${file_path}
    ${url_list}=    Evaluate    [line.strip() for line in "${lines}".split('\n') if line.strip() != '']    modules=string
    [Return]    ${url_list}

Download file
    [Arguments]    ${x_path}
    Click Element    ${x_path}
    Sleep    2s
    #Press Keys    None    ${KEY_ENTER}
