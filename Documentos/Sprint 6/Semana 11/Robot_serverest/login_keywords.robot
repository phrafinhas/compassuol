*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary
Documentation     Keywords para ações de login no serverest  
*** Variables ***
${email_para_login}        fulano@qa.com
${password_para_login}    teste

*** Keywords ***

POST Endpoint /login
   &{payload}    Create Dictionary    email=${email_para_login}     password=${password_para_login}
   ${response}         POST On Session    Serverest    /login    json=&{payload}
   Set Global Variable   ${response}
   Log To Console    Response:  ${response.content}  
   Log To Console    Token: ${response.json()["authorization"]}

Validar Ter Logado
   Should Be Equal       ${response.json()["message"]}  Login realizado com sucesso
   Should Not Be Empty   ${response.json()["authorization"]}

Fazer Login e Armazenar Token   
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}        Set Variable    ${response.json()["authorization"]}
    Log To Console      Token Salvo:    ${token_auth}
    Set Global Variable   ${token_auth}

    
