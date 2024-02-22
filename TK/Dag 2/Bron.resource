*** Keywords ***
Login
  [Arguments]  ${url}
        ...   ${gebruikersnaam} 
        ...   ${wachtwoord}
  Log    Open webpagina: ${url}   
  Log    Voer in gebruikersnaam: ${gebruikersnaam}
  Log    Voer in wachtwoord: ${wachtwoord}
  Log    Klik op de knop bevestigen 

*** Variables ***
${url}	      https://parabank.parasoft.com
${naam}	      UWVTATester