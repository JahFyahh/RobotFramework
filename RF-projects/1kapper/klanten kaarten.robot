*** Settings ***
Library    String
Library    SeleniumLibrary
Library    OperatingSystem
Library    CSVLibrary

*** Variables ***
${URL}               https://employee.1kapper.nl/login
${Browser}           Chrome
${Username}          luc5429
${Password}          @kap8483
${File_Path}         C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\id_links.txt     # Replace with path to your links file
${Download_Path}     C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\Kleurenkaart     # Replace with path to your download directory
${CSV_File}          C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\logboek_klanten.csv

*** Test Cases ***
Download Files from URLs
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=username    ${Username}
    Input Password    id=password    ${Password}
    Click Button    xpath=//*[@id="app"]/div[2]/div/div/div/div/form/div[4]/button
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[4]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[4]/a
    Click Element    xpath=//*[@id="main"]/div[1]/div/ul/li[3]/a
    Clear Element Text    xpath=//*[@id="filter-form"]/div/div[1]/div/div/div/div/input
    Input Text    xpath=//*[@id="filter-form"]/div/div[1]/div/div/div/div/input    01/06/2023
    Press Keys    xpath=//*[@id="filter-form"]/div/div[1]/div/div/div/div/input    \\13
    Sleep    5s
    Click Element    xpath=//*[@id="main"]/div[2]/div/div/div[2]/div/div[2]/div[6]/a
    FOR    ${page}    IN RANGE    0    12    # Assuming 10 pages, adjust as needed
        Log    ${page}
        Save Table Data To CSV
        Click Next Page
    END

*** Keywords ***
Save Table Data To CSV
    ${table_rows} =    Get Element Attribute    xpath=//*[@id="main"]/div[2]/div/div/div[4]/table    outerHTML
    Append To CSV    ${CSV_File}    ${table_rows}

Click Next Page
    Click Element    xpath=//*[@id="main"]/div[2]/div/div/div[5]/nav/ul/li[14]/a

Append To CSV
    [Arguments]    ${file_path}    @{data}
    Append To CSV File    ${file_path}    ${data}