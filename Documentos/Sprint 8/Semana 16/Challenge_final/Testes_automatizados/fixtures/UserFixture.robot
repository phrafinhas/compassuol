*** Settings ***
Documentation   Massa fixa
Library    Collections

*** Keywords ***

Usuário fixo 
   &{user}=    Create Dictionary
    ...    name=Raphael
    ...    email=raphael@email.com
    ...    password=123456
    [Return]    ${user}

    