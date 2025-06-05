*** Settings ***
Library     RequestsLibrary
Library     Collections
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/usuario_keywords.robot 
Resource    ../keywords/produtos_keywords.robot 
Resource    ../keywords/carrinho_keywords.robot 
Resource    ../common/common.robot
Resource    ../variables/endpoints.robot
Resource    ../keywords/dynamics.robot
Test Setup  Criar Sessao     #Criar Sessao roda antes de cada teste


*** Test Cases ***

# Usuario

Cenario: POST Cadastrar usuarios 201                   #ok
    [tags]    cadastrar_usuarios    a
    Cadastrar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code    201
    Validar Mensagem Contem    sucesso

Cenario: GET Listar usuarios cadastrados 200           #ok 
    [tags]    listar_usuarios      a
    GET Endpoint /usuarios
    Validar Status Code    200 
    Printar conteudo da response

Cenario: GET Buscar usuario por id 200           
    [tags]    buscar_usuarios  a
    Criar Usuario e Logar
    GET Endpoint buscar/usuarios
    Validar Status Code    200  

Cenario: PUT Editar usuarios 200
    [tags]        editar_usuarios    a
    Criar Usuario e Logar
    PUT Endpoint /usuarios
    Validar Status Code    200  
    Validar Mensagem Contem    sucesso

Cenario: DELETE Excluir usuarios 200
    [tags]    deletar_usuarios    a
    Criar Usuario e Logar
    DELETE Endpoint /usuarios
    Validar Mensagem Contem    sucesso
    Validar Status Code    200  


# Login

Cenario: POST Realizar login 200
    [tags]    login_usuarios    a
    Criar Usuario e Logar
    Validar Status Code    200     


# Produtos

Cenario: POST cadastrar produtos 201
    [Tags]    cadastrar_produto    a
    Criar Produto Com Usuario Logado
    Validar Status Code    201
    Validar Ter Criado produto

Cenario: GET Listar produtos cadastrados 200
    [Tags]    listar_produtos    a
    GET Endpoint /produtos
    Validar Status Code    200  

Cenario: GET Buscar produto por id 200
    [Tags]    buscar_produtos    a
    Criar Produto Com Usuario Logado
    GET Endpoint buscar/produtos
    Validar Status Code    200  

Cenario: DELETE Excluir Produto 200
    [Tags]    delete_produtos    a
    Criar Produto Com Usuario Logado
    DELETE Endpoint /produtos
    Validar Status Code    200
    Validar Mensagem Contem    sucesso

Cenario: PUT Editar produto 200
    [Tags]    editar_produtos    a
    Criar Produto Com Usuario Logado
    PUT Endpoint editar/produtos
    Validar Status Code    200  


# Carrinhos

Cenario: GET Listar carrinho cadastrado 200
    [Tags]    listar_carrinhos    a
    Criar Usuario e Logar
    GET Endpoint /carrinhos
    Validar Status Code    200  

Cenario: POST Cadastrar carrinho 201
    [Tags]    cadastrar_carrinho    a
    Criar Produto Com Usuario Logado
    POST Endpoint /carrinhos
    Validar Status Code    201

Cenario: GET Buscar carrinho por id 200
    [Tags]    buscar_carrinhos    a
    Criar Produto Com Usuario Logado
    POST Endpoint /carrinhos
    GET Endpoint buscar/carrinhos
    Validar Status Code    200  

Cenario: DELETE cancelar-compra carrinho 200
    [Tags]    delete_carrinhos    a
    Criar Produto Com Usuario Logado
    POST Endpoint /carrinhos
    DELETE Endpoint cancelar-compra/carrinhos
    Validar Status Code    200  


Cenario: Login com senha invalida 401
    [Tags]    senha_invalida    a
    Cadastrar Dados Usuario Valido
    POST Endpoint /usuarios
    POST Endpoint /login senha invalida
    Validar Status Code    401   



Criar produto sem autenticacao 401   
   [Tags]    auth_invalido    a
   Criar Usuario e Logar
   POST Endpoint sem_auth/produtos
   Validar Status Code    401   