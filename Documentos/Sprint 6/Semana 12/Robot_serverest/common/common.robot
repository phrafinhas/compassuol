*** Settings ***
Documentation        Keywords compartilhadas (ex: Criar Sessão)
Library     RequestsLibrary
Library     Collections
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/usuario_keywords.robot 
Resource    ../keywords/produtos_keywords.robot 
Resource    ../variables/endpoints.robot
Resource    ../keywords/dynamics.robot

*** Keywords ***
Criar Sessao    
    Log To Console    Criando sessão com a API Serverest
    Create Session    Serverest    ${BASE_URL}

Criar Usuario e Logar
    Cadastrar Dados Usuario Valido
    POST Endpoint /usuarios
    POST Endpoint /login
    Validar Ter Logado

Criar Produto Com Usuario Logado
    Criar Usuario e Logar
    Cadastrar Produto Valido
    POST Endpoint /produtos
    Validar Ter Criado produto

Validar Status Code
    [Arguments]    ${statuscode}
    Should Be True    ${response.status_code} == ${statuscode}


Validar Mensagem Contem
    [Arguments]    ${palavra}
    Should Contain    ${response.json()["message"]}    ${palavra}

Printar conteudo da response
    Log To Console    Response: ${response.json()["usuarios"][0]["nome"]}
