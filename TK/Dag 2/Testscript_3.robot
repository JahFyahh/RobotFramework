# My first testscript

*** Test Cases ***
Aanmelden met geldige gegevens
  inloggen_parasoft
  Log  Controleer titel inlog pagina
  Log  Klik op uitloggen
  Log  Sluit de browser

Aanmelden met ongeldige gegevens
  inloggen_parasoft 
  Log  Controleer foutmelding
  Log  Sluit de browser

*** Keywords ***
inloggen_parasoft
  Log  Open browser en ga naar webpagina: https://parabank.parasoft.com
  Log  Voer in gebruikersnaam: UWVTATester
  Log  Voer in wachtwoord: UWVTATester
  Log  Klik op de knop bevestigen 
    