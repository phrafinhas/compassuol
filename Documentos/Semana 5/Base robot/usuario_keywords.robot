*** Settings ***
Documentation         Keywords e Variaveis
Library           RequestsLibrary
Library           OperatingSystem

*** Variables ***



*** Keywords *** 


POST Endpoint /usuarios
    &{payload}        Create Dictionary        nome=jarbas priest        email=teste1133133@gmail.com        password=123        administrador=true
    ${response}        POST On Session        serverest        /usuarios      json=&{payload}    
    Log To Console      Response:  ${response.content}   
    Set Global Variable    ${response}  

GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

Validar Status Code
    [Arguments]    ${statuscode}
    Should Be True    ${response.status_code} == ${statuscode}

PUT Endpoint /usuarios    
    &{payload}     Create Dictionary        nome=dufa priest        email=teste1112111111111111@gmail.com        password=123        administrador=true
    ${response}    PUT On Session        serverest        /usuarios/DP2MvO7WpQ6WBzZl      json=&{payload}    
    Log To Console      Response:  ${response.content}     
     Set Global Variable    ${response}

DELETE Endpoint /usuarios 
    ${response}        DELETE On Session    serverest         /usuarios/DP2MvO7WpQ6WBzZl 
    Log To Console      Response:  ${response.content} 
    Set Global Variable    ${response}

