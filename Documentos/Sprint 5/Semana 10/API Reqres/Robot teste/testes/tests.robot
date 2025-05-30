*** Settings ***
Documentation     Testes de API para o serviço ReqRes
Library           RequestsLibrary
Resource          ../keywords/keywords.robot
Resource          ../keywords/POST_keywords.robot
Resource          ../keywords/GET_keywords.robot
Resource          ../keywords/DELETE_keywords.robot
Resource          ../keywords/PUT_keywords.robot
Test Setup        Criar Sessao
Test Teardown     Delete All Sessions

*** Test Cases ***    
Teste: Registrar Usuário Com Dados Válidos
    [Documentation]    Verifica se é possível registrar um usuário com dados válidos
    [Tags]    registro    positivo
    Registrar Usuario        eve.holt@reqres.in    pistol
    Validar Status Code    200
    Validar Campo No Corpo Da Resposta    token

Teste: Registrar Usuário Com Dados Incompletos
    [Documentation]    Verifica se ocorre erro ao registrar usuário com dados incompletos
    [Tags]    registro    negativo
    Registrar Usuario        ${EMPTY}    ${EMPTY}
    Validar Status Code    400
    Validar Campo No Corpo Da Resposta    error

Teste: Obter Lista De Usuários
    [Documentation]    Verifica se é possível obter a lista de usuários
    [Tags]    consulta    positivo
    GET Usuarios
    Validar Status Code    200

Teste: Obter Usuário Por ID
    [Documentation]    Verifica se é possível obter um usuário específico pelo ID
    [Tags]    consulta    positivo
    GET Usuario Por ID    2
    Validar Status Code    200
    Validar Campo No Corpo Da Resposta    data

Teste: Deletar Usuário
    [Documentation]    Verifica se é possível deletar um usuário
    [Tags]    exclusao    positivo
    DELETE Usuario Por ID    2
    Validar Status Code    204

Teste: Atualizar Usuário Com PUT
    [Documentation]    Verifica se é possível atualizar um usuário com PUT
    [Tags]    atualizacao    positivo
    &{dados}=    Create Dictionary    name=Morpheus    job=Zion Leader
    Atualizar Usuario    2    ${dados}
    Validar Status Code    200
    Validar Campo Atualizado Na Resposta    updatedAt

Teste: Atualizar Usuário Parcialmente Com PATCH
    [Documentation]    Verifica se é possível atualizar parcialmente um usuário com PATCH
    [Tags]    atualizacao    positivo
    &{dados}=    Create Dictionary    job=Zion Resident
    Atualizar Usuario Parcial    2    ${dados}
    Validar Status Code    200
    Validar Campo Atualizado Na Resposta    updatedAt

Teste: Login Com Sucesso
    [Documentation]    Verifica se é possível fazer login com credenciais válidas
    [Tags]    autenticacao    positivo
    Login Usuario    eve.holt@reqres.in    cityslicka
    Validar Status Code    200
    Validar Campo No Corpo Da Resposta    token