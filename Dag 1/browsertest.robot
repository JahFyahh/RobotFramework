*** Settings ***
Library    Browser

*** Test Cases ***
Testgeval
    New Browser    headless=False
    New Page       url=https://duckduckgo.org
    Sleep          time_=5