
*** Settings ***

Library  Browser
Library  FakerLibrary
Resource   ../../resources/variables/env.resource     
Resource    ../../resources/data/RandomUser.robot
Resource    ../../resources/Keywords.resource     
Resource    ../../resources/data/UserFixture.robot
Library        ../libraries/PoltronaSequencial.py 
Suite Setup     Abrir navegador em    ${BASE_URL}
Suite Teardown      Fechar navegador


*** Test Cases ***


Deve realizar cadastro valido
    [Tags]                cadastrar
    Go to     ${BASE_URL}/register
    Confirmar a página de cadastro
    &{user}=    Gerar Usuário Aleatório
    Preencher cadastro      &{user}