*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../support/config.robot
*** Keywords ***
Atualizar Usuario
    [Documentation]    Atualiza os dados de um usuário existente
    [Arguments]    ${id}    ${body}
    ${endpoint}=    Set Variable    /users/${id}
    &{headers}=     Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    PUT On Session    ${SESSION_NAME}    ${endpoint}    json=${body}    headers=${headers}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}

Atualizar Usuario Parcial
    [Documentation]    Atualiza parcialmente os dados de um usuário existente
    [Arguments]    ${id}    ${body}
    ${endpoint}=    Set Variable    /users/${id}
    &{headers}=     Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    PATCH On Session    ${SESSION_NAME}    ${endpoint}    json=${body}    headers=${headers}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}

Validar Campo Atualizado Na Resposta
    [Documentation]    Valida se um campo específico foi atualizado na resposta
    [Arguments]    ${campo}
    Dictionary Should Contain Key    ${response.json()}    ${campo}