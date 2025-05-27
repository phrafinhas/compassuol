*** Settings ***
Documentation         Keywords e Variaveis
Library           RequestsLibrary
Library           OperatingSystem
Library            Collections 

*** Variables ***

${email_para_login}     fulano@qa.com
${password_para_login}    teste

*** Keywords *** 

POST Endpoint /login
    &{payload}        Create Dictionary                email=${email_para_login}       password=${password_para_login}        
    ${response}        POST On Session        serverest        /login      json=&{payload}    
    ${json}       Evaluate    json.loads('''${response.content}''')    json        #	Converte a resposta em JSON (dicionário Python) usando a lib jso
    ${bearer}     Set Variable    ${json['authorization']}     # Acessa o valor do campo "authorization"
    
    Log To Console     Token Bearer: ${bearer}     #	Imprime o token no terminal
    Set Global Variable    ${response}
    Set Global Variable    ${bearer}     #Torna o token disponível em outros testes