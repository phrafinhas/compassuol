*** Settings ***
Resource    base.robot

*** Keywords ***
DELETE Usuario Por ID
    [Arguments]    ${id}
    ${response}=    DELETE On Session    ${SESSION_NAME}    /users/${id}
    Set Suite Variable    ${response}
