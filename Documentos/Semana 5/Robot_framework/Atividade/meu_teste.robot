*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Buscar no Google
    Open Browser  https://www.google.com  chrome
    Input Text  name=q  Robot Framework
    Press Key  name=q  ENTER
    Sleep  3 seconds
    Close Browser
