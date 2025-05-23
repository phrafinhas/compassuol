*** Settings ***
Library    RequestsLibrary
Resource   base.robot

*** Keywords ***
Atualizar Usuario
    [Arguments]    ${id}    ${body}
    ${endpoint}=    Set Variable    /users/${id}
    &{headers}=     Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    PUT On Session    ${SESSION_NAME}    ${endpoint}    json=${body}    headers=${headers}    expected_status=ANY
    Set Suite Variable    ${response}

Validar Campo Atualizado Na Resposta
    [Arguments]    ${campo}
    Dictionary Should Contain Key    ${response.json()}    ${campo}
