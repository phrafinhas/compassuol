

*** Settings ***

Library  Browser
Library  FakerLibrary
Resource   ../../resources/variables/env.resource     
Resource    ../../resources/data/RandomUser.robot
Resource    ../../resources/Keywords.resource     
Resource    ../../resources/data/UserFixture.robot
Library        ../../libraries/PoltronaSequencial.py 
Suite Setup     Abrir navegador em    ${BASE_URL}
Suite Teardown      Fechar navegador


*** Test Cases ***

Deve fazer uma reserva
     [Tags]     buscar_filme  
    Go to     ${BASE_URL}/login
    Confirmar a página de login
    ${userfixo}=    Usuário fixo
    Realizar login    ${userfixo}
    Confirmar login com sucesso
    Buscar filme
    Confirmar página de buscar filmes
    Pesquisar filme
    Ver detalhes do filme 
    Confirmar pagina de sessôes 
    Liberar assentos  
    Selecionar assentos
    Realizar pagamento 
    Confirmar reserva
    Realizar logout

