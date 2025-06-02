*** Settings ***
Library    RequestsLibrary


*** Variables ***


*** Keywords ***

POST Endpoint /produtos
   &{header}    Create Dictionary    Authorization=${token_auth}
   &{payload}    Create Dictionary    nome=MouseTech3    preco=400    descricao=Mouse    quantidade=100
   ${response}         POST On Session    Serverest    /produtos    json=&{payload}    headers=${header}
   Set Global Variable   ${response}
   Log To Console    Response:  ${response.content}  
   Log To Console    Token: ${response.json()["message"]}   