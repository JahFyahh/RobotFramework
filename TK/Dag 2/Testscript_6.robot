# My first testscript

*** Settings ***
Resource      Bron.resource
Library       Browser

*** Test Cases ***
Aanmelden met geldige gegevens
  Login  url=${url}
    ...  gebruikersnaam=${naam} 
    ...  wachtwoord=UWVTATester
  Log     Controleer titel inlog pagina
  Log     Uitloggen

Aanmelden met ongeldige gegevens
  Login  url=${url}
    ...  gebruikersnaam=${naam} 
    ...  wachtwoord=NotUWVTATester
  Log     Controleer foutmelding
  Log     Sluit de browser
