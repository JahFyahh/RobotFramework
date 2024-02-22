*** Settings ***
Library    SeleniumLibrary
Library    CSVLibrary

*** Variables ***
${URL}               https://employee.1kapper.nl/login
${Browser}           Chrome
${Username}          luc5429-3
${Password}          
${CSV_File}          C:\\pCloud\\Holding\\Nayrobiz\\Boekhouden\\1kapper\\klanten\\kapper_data.csv

*** Test Cases ***
Login and Extract Data
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=username    ${Username}
    Input Password    id=password    ${Password}
    Click Button    xpath=//*[@id="app"]/div[2]/div/div/div/div/form/div[4]/button
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[3]/a
    Click Element    xpath=//*[@id="header"]/div/div/div/div/ul/li[3]/a
    Wait Until Page Contains Element    xpath=//*[@id="main"]/div[2]/div/div/div[5]/table
    FOR    ${page}    IN RANGE    0    36    # Assuming 10 pages, adjust as needed
        Log    ${page}
        Save Table Data To CSV
        Click Next Page
    END

*** Keywords ***
Save Table Data To CSV
    ${table_rows} =    Get Element Attribute    xpath=//*[@id="main"]/div[2]/div/div/div[5]/table    outerHTML
    Append To CSV    ${CSV_File}    ${table_rows}

Click Next Page
    Click Element    xpath=//*[@id="main"]/div[2]/div/div/div[6]/nav/ul/li[15]/a

Append To CSV
    [Arguments]    ${file_path}    @{data}
    Append To CSV File    ${file_path}    ${data}

