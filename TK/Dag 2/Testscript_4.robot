# My first testscript

*** Test Cases ***
Aanmelden met geldige gegevens
  Login    url=https://parabank.parasoft.com    
  ...      gebruikersnaam=UWVTATester    
  ...      wachtwoord=UWVTATester
  Log     Controleer titel inlog pagina
  Log     Uitloggen

Aanmelden met ongeldige gegevens
  Login    url=https://parabank.parasoft.com    
  ...      gebruikersnaam=UWVTATester    
  ...      wachtwoord=NotUWVTATester
  Log     Controleer foutmelding
  Log     Sluit de browser

*** Keywords ***
Login
  [Arguments]  
  ...    ${url} 
  ...    ${gebruikersnaam}
  ...    ${wachtwoord}
  Log  Open webpagina ${url}
  Log  Voer in gebruikersnaam: ${gebruikersnaam}
  Log  Voer in wachtwoord: ${wachtwoord}
  Log  Klik op de knop bevestigen  
    

