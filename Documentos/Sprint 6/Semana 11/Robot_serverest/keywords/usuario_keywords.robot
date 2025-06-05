*** Settings ***
Library    RequestsLibrary
Resource    dynamics.robot
Resource    ../variables/endpoints.robot
Resource    login_keywords.robot



*** Keywords ***



POST Endpoint /usuarios    
  ${response}         POST On Session    Serverest    ${ENDPOINT_USUARIOS}         json=&{payload}  
  Log To Console    Response: ${response.content}
  Set Global Variable   ${response}
  ${id_usuario}=    Set Variable    ${response.json()["_id"]} 
  Set Global Variable    ${ID_USUARIO_ATUAL}    ${id_usuario}
  Log To Console    ID do usuário atual: ${ID_USUARIO_ATUAL} 
 


GET Endpoint /usuarios
   ${response}         GET On Session    Serverest    ${ENDPOINT_USUARIOS}   
   Set Global Variable   ${response}
   Log To Console    Response body: ${response.content}
 


PUT Endpoint /usuarios  
  Set To Dictionary    ${payload}    nome=Fulano da Silva
  &{header}=    Create Dictionary    Authorization=${TOKEN_AUTH_ATUAL}
  ${response}=     PUT On Session    Serverest    ${ENDPOINT_USUARIOS}/${ID_USUARIO_ATUAL}
...  json=${payload}
...  headers=${header}
    Set Global Variable    ${response}
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Resposta: ${response.json()}




GET Endpoint buscar/usuarios
   ${response}         GET On Session    Serverest    ${ENDPOINT_USUARIOS}/${ID_USUARIO_ATUAL}   
   Set Global Variable   ${response}
   Log To Console    Response body: ${response.content}    


DELETE Endpoint /usuarios
   ${response}         DELETE On Session    Serverest    ${ENDPOINT_USUARIOS}/${ID_USUARIO_ATUAL}
