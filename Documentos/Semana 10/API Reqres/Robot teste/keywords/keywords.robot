*** Settings ***
Documentation     Keywords comuns para testes da API ReqRes
Library           RequestsLibrary
Library           Collections
Resource    ../support/config.robot

*** Keywords ***
Criar Sessao
    [Documentation]    Cria uma sessão HTTP com a API ReqRes
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    Create Session    ${SESSION_NAME}    ${BASE_URL}    headers=${headers}    timeout=${TIMEOUT}    verify=True

Validar Status Code
    [Documentation]    Valida se o status code da resposta é o esperado
    [Arguments]    ${status_code}
    Should Be Equal As Integers    ${response.status_code}    ${status_code}