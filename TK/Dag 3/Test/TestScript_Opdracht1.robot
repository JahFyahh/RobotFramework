*** Settings ***
Resource      ../Resource/Keywords.resource
Test Setup    Open browser & navigeer naar url    url=${url}

*** Variables ***
${url}	         https://thinking-tester-contact-list.herokuapp.com/
${email}	     TA_Tester5@gmail.com
${wachtwoord}    TA_Tester5

*** Test Cases ***
Aanmelden met geldige gegevens
  Login  email=${email} 
  ...    wachtwoord=${wachtwoord}
  Get Text    xpath=/html/head/title    equals    My Contacts
  Logout

Aanmelden met ongeldige gegevens
  Login  email=${email}  
  ...    wachtwoord=NotUWVTATester
  Get Text    id=error    equals    Incorrect username or password

