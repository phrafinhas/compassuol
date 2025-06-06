*** Settings ***
Library    RequestsLibrary
Resource    ../variables/endpoints.robot
Resource    dynamics.robot
Library    Collections
Documentation    Keywords para ações de login no serverest  

*** Keywords ***

POST Endpoint /login
    &{payload}    Create Dictionary    email=${email_atual}    password=${senha_atual}
    ${response}    POST On Session    Serverest    ${ENDPOINT_LOGIN}    json=&{payload}
    Set Global Variable    ${response}
    Log To Console    Response:  ${response.content}  
    Log To Console    Token: ${response.json()["authorization"]}
    ${token}=    Set Variable    ${response.json()["authorization"]}
    Set Suite Variable    ${TOKEN_AUTH_ATUAL}    ${token}
    Log To Console    Token atual: ${TOKEN_AUTH_ATUAL}    

Validar Ter Logado
    Should Be Equal    ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}

POST Endpoint /login senha invalida
    ${payload}=    Create Dictionary    email=${email_atual}    password=senhaErrada
    ${response}=    POST On Session    Serverest    /login    json=${payload}    expected_status=401
    Should Be Equal As Integers    ${response.status_code}    401
    Set Global Variable    ${response}
    Log To Console    ${response.content}
