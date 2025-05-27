*** Settings ***
Documentation         Keywords e Variaveis
Library           RequestsLibrary
Library           OperatingSystem
Library    SeleniumLibrary

*** Variables ***
${token_auth}  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNzQ4MzU4NzgwLCJleHAiOjE3NDgzNTkzODB9.-pJB2s7Stb0NL37dZLI_jsUDnF2nxUw5aR5qEVPfqQw


*** Keywords *** 

POST Endpoint /produtos
    &{header}         Create Dictionary        authorization=Bearer ${token_auth}
    &{payload}        Create Dictionary              nome=MouseTech    preco=400    descricao=MouseTech    quantidade=100
    ${response}        POST On Session        serverest        /produtos      json=&{payload}        headers=${header}
    Log To Console      Response: ${response.content}
    Set Global Variable     ${response}   