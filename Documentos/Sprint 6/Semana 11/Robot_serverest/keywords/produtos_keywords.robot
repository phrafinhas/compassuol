*** Settings ***
Library    RequestsLibrary
Resource    dynamics.robot
Resource    login_keywords.robot


*** Variables ***


*** Keywords ***

POST Endpoint /produtos
   &{header}    Create Dictionary    Authorization=${TOKEN_AUTH_ATUAL}
   ${response}         POST On Session    Serverest    ${ENDPOINT_PRODUTOS}    json=${produto}    headers=${header}
   Set Global Variable   ${response} 
   Log To Console    Token: ${response.json()["message"]}  
   Log To Console    Produto: ${produto}
   Log To Console    ID: ${response.json()["_id"]}
   ${Id}=    Set Variable    ${response.json()["_id"]}
   Set Suite Variable    ${ID_PRODUTO_ATUAL}    ${Id}
   Log To Console       ID atual: ${ID_PRODUTO_ATUAL} 
   Set Global Variable   ${ID_PRODUTO_ATUAL} 



GET Endpoint /produtos
   ${response}         GET On Session    Serverest    ${ENDPOINT_PRODUTOS}   
   Set Global Variable   ${response}
   Log To Console    Response body: ${response.content}


GET Endpoint buscar/produtos
   ${response}         GET On Session    Serverest    ${ENDPOINT_PRODUTOS}/${ID_PRODUTO_ATUAL}   
   Set Global Variable   ${response}
   Log To Console    Response body: ${response.content}    
  

Validar Ter Criado produto    
  Should Be Equal       ${response.json()["message"]}  Cadastro realizado com sucesso
   Should Not Be Empty   ${response.json()["_id"]}


PUT Endpoint editar/produtos
  ${produto_editado}=        FakerLibrary.Company
  Set To Dictionary    ${produto}    nome=${produto_editado}
   &{header}=    Create Dictionary    Authorization=${TOKEN_AUTH_ATUAL}
   ${response}=     PUT On Session    Serverest    ${ENDPOINT_PRODUTOS}/${ID_PRODUTO_ATUAL}
...  json=${produto}
...  headers=${header}
    Set Global Variable    ${response}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Resposta: ${response.json()}

DELETE Endpoint /produtos
  &{header}=    Create Dictionary    Authorization=${TOKEN_AUTH_ATUAL}
  ${response}         DELETE On Session    Serverest    ${ENDPOINT_PRODUTOS}/${ID_PRODUTO_ATUAL}
...  headers=${header}
  Set Global Variable    ${response}
  Log To Console    Resposta: ${response.json()}

  
POST Endpoint sem_auth/produtos
   Cadastrar Produto Valido
   &{header}    Create Dictionary    Authorization=123
   ${response}         POST On Session    Serverest    ${ENDPOINT_PRODUTOS}    json=${produto}    headers=${header}   expected_status=401
   Should Be Equal As Integers        ${response.status_code}    401
   Set Global Variable   ${response}
   Log To Console     ${response.content} 