*** Settings ***
Documentation     Arquivo simples para requisições HTTP em APIs
Library           RequestsLibrary
Library           OperatingSystem
resource          usuario_keywords.robot
resource          login_keywords.robot
resource          produtos_keywords.robot


*** Variables ***
${BASE_URL}       https://serverest.dev

*** Test Cases ***
Cenario: GET Todos os Usuarios - 200
    [Tags]    GET    
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code    200
    Log To Console    ${response.json()}



Cenario: POST Cadastrar Usuario 201  
    [Tags]    POST      
    Criar Sessao    
    POST Endpoint /usuarios
    Validar Status Code   201

Cenario: PUT Editar Usuario 200  
    [Tags]    PUT     
    Criar Sessao
    PUT Endpoint /usuarios
   

Cenario: DELETE deletar usuario 
     [Tags]    DELETE       
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code  200

Cenario: POST Realizar login 200
    [Tags]    POSTLOGIN  
    Criar Sessao    
    POST Endpoint /login
    Validar Status Code   200

Cenario: Post Criar Produto 201
    [Tags]    POSTPRODUTO
    Criar Sessao
    POST Endpoint /produtos
    Validar Status Code   201


*** Keywords ***
Criar Sessao
    Create Session    serverest    ${BASE_URL}
