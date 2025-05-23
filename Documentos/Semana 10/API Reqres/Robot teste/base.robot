*** Settings ***
Library           RequestsLibrary
Resource          POST_keywords.robot
Resource          GET_keywords.robot
Resource          DELETE_keywords.robot


*** Variables ***
${SESSION_NAME}        reqres
${BASE_URL}      https://reqres.in/api
${API_KEY}       reqres-free-v1


*** Keywords ***
Criar Sessao
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    Create Session    ${SESSION_NAME}    ${BASE_URL}    headers=${headers}

Validar Status Code
    [Arguments]    ${status_code}
    Should Be Equal As Integers    ${response.status_code}    ${status_code}
