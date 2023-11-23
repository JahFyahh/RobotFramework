# https://robotframework.org/#resources
# https://marketsquare.github.io/robotframework-browser/Browser.html

*** Settings ***
Library    Browser

*** Keywords ***
Open browser & navigeer naar url
  [Arguments]  ${url}

  New Browser        headless=False    browser=firefox
  New Context        viewport={'width': 1920, 'height': 1080}
  New Page           url=${url}

Login
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