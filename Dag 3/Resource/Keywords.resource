*** Keywords ***
Open browser & navigeer naar url
  [Arguments]  ${url}

  Log    Open webpagina: ${url}
Login
  [Arguments]  ${email}    
  ...          ${wachtwoord}

  Log    Voer in email: ${email}
  Log    Voer in wachtwoord: ${wachtwoord}
  Log    Klik op de knop bevestigen