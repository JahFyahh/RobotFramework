*** Settings ***
Resource    ../Resource/Keywords.resource

*** Variables ***
${url}	         https://thinking-tester-contact-list.herokuapp.com/
${email}	     TA_Tester5@gmail.com
${wachtwoord}    TA_Tester5

*** Test Cases ***
Aanmelden met geldige gegevens
  Open browser & navigeer naar url    url=${url}
  Login  email=${email} 
  ...    wachtwoord=${wachtwoord}
  Get Text    xpath=/html/head/title    equals    My Contacts
  Logout

Aanmelden met ongeldige gegevens
  Open browser & navigeer naar url    url=${url}
  Login  email=${email}  
  ...    wachtwoord=NotUWVTATester

