*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   base.robot

*** Keywords ***
Registrar Usuario
    [Arguments]        ${email}    ${password}
    ${endpoint}=    Set Variable    /register
    &{payload}=     Create Dictionary        email=${email}    password=${password}
    &{headers}=     Create Dictionary    Content-Type=application/json    Accept=application/json
    ${response}=    POST On Session    ${SESSION_NAME}    ${endpoint}    json=${payload}    headers=${headers}      expected_status=ANY
    Set Suite Variable    ${response}

Validar Campo No Corpo Da Resposta
    [Arguments]    ${campo}
    Dictionary Should Contain Key    ${response.json()}    ${campo}