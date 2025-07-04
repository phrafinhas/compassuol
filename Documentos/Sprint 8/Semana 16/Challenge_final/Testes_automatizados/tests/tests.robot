*** Settings ***

Library  Browser
Library  FakerLibrary
Resource   ../resources/env.resource     
Resource    ../dynamics/RandomUser.robot
Resource    ../resources/Keywords.resource     
Resource    ../fixtures/UserFixture.robot
Suite Setup     Abrir navegador em    ${BASE_URL}
Suite Teardown      Fechar navegador

 # *** Variables ***




*** Test Cases ***


Deve realizar cadastro valido
     [Tags]    cadastrar
    Go to     ${BASE_URL}/register
    Confirmar a página de cadastro
    &{user}=    Gerar Usuário Aleatório
    Preencher cadastro      &{user}


Deve realizar login valido
     [Tags]     Login  
    Go to     ${BASE_URL}/login
    Confirmar a página de login
    ${userfixo}=    Usuário fixo
    Realizar login    ${userfixo}
    Confirmar login com sucesso
   

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


*** Keywords ***



Buscar filme
    Click    xpath=//a[text()='Ver todos os filmes em cartaz']



Confirmar página de buscar filmes
    Wait For Elements State    xpath=//h1[text()='Filmes em Cartaz']    visible    10
    Wait For Elements State    xpath=//h1[text()='Filmes em Cartaz']    enabled    10
    ${titulo}=    Get Text    xpath=//h1[text()='Filmes em Cartaz']
    Should Be Equal    ${titulo}    Filmes em Cartaz

Pesquisar filme
    Fill Text    xpath=//input[@placeholder="Buscar filmes..."]      The Avengers
    Press Keys   xpath=//input[@placeholder="Buscar filmes..."]
    Wait For Elements State    text=The Avengers    visible    10

Ver detalhes do filme 
    Click    xpath=//div[@class="movie-card"][.//h3[text()="The Avengers"]]//a[text()="Ver Detalhes"]
    

Confirmar pagina de sessôes    
    Wait For Elements State    xpath=//h1[text()='The Avengers']    visible    10
    ${titulo}=    Get Text    xpath=//h1[text()='The Avengers']
    Should Be Equal    ${titulo}    The Avengers
    Wait For Elements State    xpath=//h2[text()='Sessões Disponíveis']    visible    10
    ${subtitulo}=    Get Text    xpath=//h2[text()='Sessões Disponíveis']
    Should Be Equal    ${subtitulo}    Sessões Disponíveis
    Wait For Elements State    xpath=//a[@href='/sessions/685ecbeadadf6a4a22b2463b']  visible    10
    # Clica no primeiro botão "Selecionar Assentos"
    Click    xpath=//a[@href='/sessions/685ecbeadadf6a4a22b2463b']

Selecionar assentos

    # Seleciona o assento e continua
    Click    xpath=//button[contains(@class,"seat") and contains(@title,"Fileira D") and contains(@title,"Assento 2")]
    Wait For Elements State    css=button.btn.btn-primary.checkout-button    visible    10
    Click    css=button.btn.btn-primary.checkout-button


Realizar pagamento     
      Wait For Elements State    xpath=//h1[text()='Finalizar Compra']    visible    10
      ${titulo}=    Get Text    xpath=//h1[text()='Finalizar Compra']
      Should Be Equal    ${titulo}    Finalizar Compra
      Click    css=button.btn.btn-primary.btn-checkout


Confirmar reserva      
    Wait For Elements State    xpath=//h1[text()='Reserva Confirmada!']    visible    10
    ${titulo}=    Get Text    xpath=//h1[text()='Reserva Confirmada!']
    Should Be Equal    ${titulo}    Reserva Confirmada!



Liberar assentos    
    Wait For Elements State    css=button[title*="Torna todos os assentos disponíveis"]    visible    10
    Wait For Elements State    css=button[title*="Torna todos os assentos disponíveis"]    enabled    10
    Click    css=button[title*="Torna todos os assentos disponíveis"]