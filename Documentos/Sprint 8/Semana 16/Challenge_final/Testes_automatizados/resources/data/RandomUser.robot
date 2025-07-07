*** Settings ***
Documentation            Contem usuários randomicos para utilização em keywords

Library    FakerLibrary
Library    Collections

*** Keywords ***

Gerar Usuário Aleatório
    ${nome}      FakerLibrary.Name
    ${email}     FakerLibrary.Email
    ${senha}=     Set Variable    123456
    &{user}      Create Dictionary    name=${nome}    email=${email}    password=${senha}
    [Return]     ${user}