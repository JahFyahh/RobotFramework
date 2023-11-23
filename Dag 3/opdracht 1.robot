*** Variables ***
${url}	      https://thinking-tester-contact-list.herokuapp.com/
${email}	    # toegewezen email:  bijvoorbeeld TA_Tester1@gmail.com

*** Test Cases ***
Aanmelden met geldige gegevens
  Login  url=${url}
  ...    email=${email} 
  ...    wachtwoord=     # toegewezen wachtwoord:  bijvoorbeeld TA_Tester1
  Log    Controleer titel inlog pagina
  Log    Uitloggen

Aanmelden met ongeldige gegevens
  Login  url=${url}
  ...    email=${email}  
  ...    wachtwoord=NotUWVTATester
  Log    Controleer foutmelding

*** Keywords ***
Login
  [Arguments]  ${url}    
  ...          ${email}    
  ...          ${wachtwoord}

  Log    Open webpagina: ${url} 
  Log    Voer in email: ${email}
  Log    Voer in wachtwoord: ${wachtwoord}
  Log    Klik op de knop bevestigen
