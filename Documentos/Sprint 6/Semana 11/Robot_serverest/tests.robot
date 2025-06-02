***Settings***
Library    RequestsLibrary
Library     Collections
Resource    login_keywords.robot
Resource    produtos_keywords.robot




*** Test Cases ***


# Login
Cenario: POST Realizar login 200
    [tags]   Login
  Criar Sessao
  POST Endpoint /login
  Validar Status Code   200  
# Usuario
Cenario: GET Listar usuario cadastrado 200
    [tags]  usuariosGet
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code    200 
    Printar conteudo da response
    #Validar Quantidade 
Cenario: POST Cadastrar usuarios 201
   [tags]   usuarios
    Criar Sessao
    POST Endpoint /usuarios
     Validar Status Code   201
     Validar Mensagem Contem    "sucesso"
    
Cenario: GET Buscar usuario por id 200
     [tags]  usuarios
    Criar Sessao
    GET Endpoint /usuarios
     Validar Status Code   200  

Cenario: DELETE Excluir usuarios 200
     [tags]  usuarios
    Criar Sessao
    DELETE Endpoint /usuarios
     Validar Status Code   200  

Cenario: PUT Editar usuarios 200
    [tags]  usuarios
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code   200  
    

# Produtos

Cenario: GET Listar produtos cadastrados 200
    [Tags]    produtos
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code   200  

Cenario: POST cadastrar produtos 201
      [Tags]    produtosCadastrar
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code   201
Cenario: GET Buscar produto por id 200
    [Tags]    produtos
    GET Endpoint /produtos
     Validar Status Code   200  
Cenario: DELETE Excluir produto 200
    [Tags]    produtos
    Criar Sessao
    DELETE Endpoint /produtos
    Criar Produto e Armazenar ID
     Validar Status Code   200  
Cenario: PUT Editar produto 200
    [Tags]    produtos
    PUT Endpoint /produtos
     Validar Status Code   200  

# Carrinhos

Cenario: GET Listar carrinho cadastrado 200
    [Tags]    carrinhos
    GET Endpoint /carrinhos
     Validar Status Code   200  
Cenario: POST Cadastrar carrinho 201
    [Tags]    carrinhos
     POST Endpoint /carrinhos
      Validar Status Code   201
Cenario: GET Buscar carrinho por id 200
    [Tags]    carrinhos
     GET Endpoint /carrinhos
      Validar Status Code   200  
Cenario: DELETE Excluir carrinho 200
    [Tags]    carrinhos
     DELETE Endpoint /carrinhos
      Validar Status Code   200  






*** Keywords ***

Criar Sessao
    Create Session    Serverest      https://serverest.dev

 GET Endpoint /usuarios
   ${response}         GET On Session    Serverest    /usuarios   
   Set Global Variable   ${response}

Validar Status Code   
    [Arguments]     ${statuscode}
    Should Be True   ${response.status_code}  == ${statuscode}

POST Endpoint /usuarios
  &{payload}            Create Dictionary        nome=judas priest      email=testeiulll@gmail.com    password=123     admnistrador=true        
  ${response}         POST On Session    Serverest    /usuarios        json=&{payload}  
  Log To Console    Response: ${response.content}
  Set Global Variable   ${response}

#Validar Quantidade     
    # Should Be Equal As Integers    ${response.json()["quantidade"]}        31

Validar Mensagem Contem 
   [Arguments]  ${palavra}
    Should Contain       ${response.json()["message"]}      ${palavra}

Printar conteudo da response
    Log To Console   Response: ${response.json()["usuarios"][0]["nome"]}    