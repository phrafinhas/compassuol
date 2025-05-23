*** Settings ***
Library    RequestsLibrary
Resource    base.robot
Resource    POST_keywords.robot
Resource    GET_keywords.robot
Resource    DELETE_keywords.robot
Resource    PUT_keywords.robot

*** Test Cases ***    
Cenario Registrar Usuario Com Dados Validos
    Criar Sessao
    Registrar Usuario        eve.holt@reqres.in    pistol
    Validar Status Code    200
    Validar Campo No Corpo Da Resposta    token

Cenario Registrar Usuario Com Dados Incompletos
    Criar Sessao
    Registrar Usuario        ${EMPTY}    ${EMPTY}
    Validar Status Code    400
    Validar Campo No Corpo Da Resposta    error

Cenario Obter Usuario
    Criar Sessao
    GET Usuarios
    Validar Status Code    200

Cenario Deletar Usuario
    Criar Sessao
    DELETE Usuario Por ID    2
    Validar Status Code    204


Cenario Atualizar Usuario Com PUT
    Criar Sessao
    &{dados}=    Create Dictionary    name=Morpheus    job=Zion Leader
    Atualizar Usuario    2    ${dados}
    Validar Status Code    200
    Validar Campo Atualizado Na Resposta    updatedAt
