*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../support/config.robot

*** Keywords ***
GET Usuarios
    [Documentation]    Obtém a lista de usuários
    [Arguments]    ${page}=1
    ${endpoint}=    Set Variable    /users?page=${page}
    ${response}=    GET On Session    ${SESSION_NAME}    ${endpoint}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}

GET Usuario Por ID
    [Documentation]    Obtém um usuário específico pelo ID
    [Arguments]    ${id}
    ${endpoint}=    Set Variable    /users/${id}
    ${response}=    GET On Session    ${SESSION_NAME}    ${endpoint}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}