# My first testscript

*** Test Cases ***
Aanmelden met geldige gegevens
  Log  Open browser FireFox
  Log  Navigeer naar webpagina: https://parabank.parasoft.com
  Log  Type UWVTATester in het Username veld
  Log  Type UWVTATester in het Password veld
  Log  Click op knop: LOG IN
  Log  Controleer success melding op pagina
  Log  Klik op uitloggen
  Log  Sluit browser

Aanmelden met ongeldige gegevens
  Log  Open browser FireFox
  Log  Navigeer naar webpagina: https://parabank.parasoft.com
  Log  Type UWVTATester in het Username veld
  Log  Type UWVTATester in het Password veld
  Log  Click op knop: LOG IN
  Log  Controleer foutmelding op de pagina
  Log  Sluit browser