*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../support/config.robot

*** Keywords ***
DELETE Usuario Por ID
    [Documentation]    Deleta um usuário pelo ID
    [Arguments]    ${id}
    ${endpoint}=    Set Variable    /users/${id}
    ${response}=    DELETE On Session    ${SESSION_NAME}    ${endpoint}    expected_status=ANY
    Set Test Variable    ${response}
    RETURN    ${response}