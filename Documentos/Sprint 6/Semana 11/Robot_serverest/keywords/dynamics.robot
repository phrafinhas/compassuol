*** Settings ***

Documentation    Keywords e Variaveis para ações gerais
Library         FakerLibrary  # constroi dados dinamicos





*** Keywords ***

Cadastrar Dados Usuario Valido

    ${nome}         FakerLibrary.Name
    ${email}        FakerLibrary.Email
    &{payload}      Create Dictionary       
    ...    nome=${nome}    
    ...    email=${email}    
    ...    password=senha123    
    ...    administrador=true   
    Log to Console    ${payload}
    Set Global Variable  &{payload}
      # Armazena o email e senha para outros testes
    Set Global Variable    ${email_atual}    ${email}
    Set Global Variable    ${senha_atual}    senha123
    RETURN          &{payload}  
 


Cadastrar Produto Valido

    ${nome_produto}=        FakerLibrary.Company
    ${marca_produto}=       FakerLibrary.Lexify
    ${nome}=                Set Variable    ${marca_produto} ${nome_produto}
    ${preco}=               Evaluate    random.randint(100, 1000)    modules=random
    ${descricao}=           FakerLibrary.Word
    ${quantidade}=          Evaluate    random.randint(1, 100)    modules=random

    &{produto}=             Create Dictionary
    ...                     nome=${nome}
    ...                     preco=${preco}
    ...                     descricao=${descricao}
    ...                     quantidade=${quantidade}
    Log to Console    ${produto}
    Set Global Variable    &{produto}

    RETURN    &{produto}