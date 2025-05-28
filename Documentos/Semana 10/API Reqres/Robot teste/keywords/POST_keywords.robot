*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../support/config.robot

*** Keywords ***
Registrar Usuario
    [Documentation]    Registra um novo usuário na API
    [Arguments]        ${email}    ${password}
    ${endpoint}=    Set Variable    /register
    &{payload}=     Create Dictionary    email=${email}    password=${password}
    &{headers}=     Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    POST On Session    ${SESSION_NAME}    ${endpoint}    json=${payload}    headers=${headers}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}

Validar Campo No Corpo Da Resposta
    [Documentation]    Valida se um campo específico existe no corpo da resposta
    [Arguments]    ${campo}
    Dictionary Should Contain Key    ${response.json()}    ${campo}

Login Usuario
    [Documentation]    Realiza login de um usuário
    [Arguments]    ${email}    ${password}
    ${endpoint}=    Set Variable    /login
    &{payload}=     Create Dictionary    email=${email}    password=${password}
    &{headers}=     Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    POST On Session    ${SESSION_NAME}    ${endpoint}    json=${payload}    headers=${headers}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}