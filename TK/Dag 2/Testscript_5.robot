# My first testscript

*** Variables ***
${url}               https://parabank.parasoft.com
${gebruikersnaam}    UWVTATester

*** Test Cases ***
Aanmelden met geldige gegevens
  Login  url=${url}
    ...  gebruikersnaam=${gebruikersnaam}
    ...  wachtwoord=UWVTATester
  Log     Controleer titel inlog pagina
  Log     Uitloggen
  Log     Sluit de browser

Aanmelden met ongeldige gegevens
  Login  url=${url}
    ...  gebruikersnaam=${gebruikersnaam}
    ...  wachtwoord=NotUWVTATester
  Log     Controleer foutmelding
  Log     Sluit de browser

*** Keywords ***
Login
  [Arguments]  ${url}
        ...    ${gebruikersnaam} 
        ...    ${wachtwoord}
  Log    Open webpagina: ${url} 
  Log    Voer in gebruikersnaam: ${gebruikersnaam}
  Log    Voer in wachtwoord: ${wachtwoord}
  Log    Klik op de knop bevestigen 
