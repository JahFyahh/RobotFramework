*** Settings ***
Library    SeleniumLibrary
Library    CSVLibrary

*** Variables ***
${URL}               https://employee.1kapper.nl/login
${Browser}           Chrome
${Username}          luc5429
${Password}          
${CSV_File}          C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\inactive_klanten.csv

*** Test Cases ***
Login and Extract Data
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=username    ${Username}
    Input Password    id=password    ${Password}
    Click Button    xpath=//*[@id="app"]/div[2]/div/div/div/div/form/div[4]/button
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[4]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[4]/a
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[4]/a
    Click Element    xpath=//*[@id="main"]/div[1]/div/ul/li[5]/a
    Wait Until Page Contains Element    xpath=//*[@id="inactive-customers"]/div[2]/nav/ul/li[15]/a
    FOR    ${page}    IN RANGE    0    21    # Assuming 10 pages, adjust as needed
        Log    ${page}
        Save Table Data To CSV
        Click Next Page
    END

*** Keywords ***
Save Table Data To CSV
    ${table_rows} =    Get Element Attribute    xpath=//*[@id="inactive-customers"]/div[1]/table    outerHTML
    Append To CSV    ${CSV_File}    ${table_rows}

Click Next Page
    Click Element    xpath=//*[@id="inactive-customers"]/div[2]/nav/ul/li[15]/a

Append To CSV
    [Arguments]    ${file_path}    @{data}
    Append To CSV File    ${file_path}    ${data}

