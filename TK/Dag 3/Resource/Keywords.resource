# https://robotframework.org/#resources
# https://marketsquare.github.io/robotframework-browser/Browser.html
# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
# Automated variables?

*** Settings ***
Library    Browser

*** Keywords ***
Open browser & navigeer naar url
  [Documentation]    Open een nieuwe browser, zet de grootte van de browser naar 1920x1080 en navigeer naar de opgegeven url
  [Arguments]  ${url}

  New Browser        headless=False    browser=firefox
  New Context        viewport={'width': 1920, 'height': 1080}
  New Page           url=${url}

Login
  [Documentation]    Login met email en wachtwoord, noteer alle errors, wacht 2 seconden en maak een screenshot
  [Arguments]  ${email}    
  ...          ${wachtwoord}

  Type Text    id=email       ${email}
  Type Text    id=password    ${wachtwoord}
  Click        id=submit
  Get Page Errors
  Sleep        2s
  Take Screenshot    #filename=${CURDIR}/../outputs/robotframework-browser-screenshot-{index}.jpg

Logout
  Click    id=logout