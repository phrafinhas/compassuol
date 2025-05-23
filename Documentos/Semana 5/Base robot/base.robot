*** Settings ***
Documentation     Arquivo simples para requisições HTTP em APIs
Library           RequestsLibrary
Library           OperatingSystem

*** Variables ***
${BASE_URL}       https://serverest.dev

*** Test Cases ***
GET Todos os Usuarios - 200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code    200


Cenario: POST Cadastrar Usuario 201    
    Criar Sessao    
    POST Endpoint /usuarios
    Validar Status Code   201

Cenario: PUT Editar Usuario 200   
    Criar Sessao
    PUT Endpoint /usuarios

Cenario: DELETE deletar usuario    
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code  200



*** Keywords ***
Criar Sessao
    Create Session    serverest    ${BASE_URL}

POST Endpoint /usuarios
    &{payload}        Create Dictionary        nome=jarbas priest        email=teste11111111111111@gmail.com        password=123        administrador=true
    ${response}        POST On Session        serverest        /usuarios      json=&{payload}    
    Log To Console      Response:  ${response.content}   
    Set Global Variable    ${response}  

GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

Validar Status Code
    [Arguments]    ${statuscode}
    Should Be True    ${response.status_code} == ${statuscode}

PUT Endpoint /usuarios    
    &{payload}     Create Dictionary        nome=dufa priest        email=teste1112111111111@gmail.com        password=123        administrador=true
    ${response}    PUT On Session        serverest        /usuarios/DP2MvO7WpQ6WBzZl      json=&{payload}    
    Log To Console      Response:  ${response.content}     
     Set Global Variable    ${response}

DELETE Endpoint /usuarios 
    ${response}        DELETE On Session    serverest         /usuarios/DP2MvO7WpQ6WBzZl 
    Log To Console      Response:  ${response.content} 
    Set Global Variable    ${response}

