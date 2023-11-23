*** Settings ***
Resource    ../Resource/Keywords.resource

*** Variables ***
${url}	         https://thinking-tester-contact-list.herokuapp.com/
${email}	     TA_Tester18@gmail.com
${wachtwoord}    TA_Tester18

*** Test Cases ***
Aanmelden met geldige gegevens
  Open browser & navigeer naar url    url=${url}
  Login  email=${email} 
  ...    wachtwoord=${wachtwoord}
  Log    Controleer titel inlog pagina
  Log    Uitloggen

Aanmelden met ongeldige gegevens
  Open browser & navigeer naar url    url=${url}
  Login  email=${email}  
  ...    wachtwoord=NotUWVTATester
  Log    Controleer foutmelding
