*** Settings ***
Resource    base.robot

*** Keywords ***
GET Usuarios
    ${response}=    GET On Session    ${SESSION_NAME}    /users
    Set Suite Variable    ${response}
