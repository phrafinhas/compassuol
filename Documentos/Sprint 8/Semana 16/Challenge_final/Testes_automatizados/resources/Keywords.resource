*** Settings ***
Documentation        Keywords reutilizáveis 
Library        Browser
Resource    locators/FilmesLocators.robot
Resource    ../resources/locators/FilmesLocators.robot
Resource    locators/PagamentoLocators.robot
Resource    locators/ReservaLocators.robot
Resource    Locators/SessaoLocators.robot
Resource   ../resources/variables/env.resource     
Resource    ../resources/data/RandomUser.robot


*** Keywords ***

Abrir navegador em
    [Arguments]    ${url}
    New Browser    headless=False
    New Page       ${url} 
    Sleep          5s   

Fechar navegador
    Close Browser


Preencher cadastro
    [Arguments]        &{user}
    Fill Text    css=#name              ${user.name}
    Fill Text    css=#email             ${user.email}
    Fill Text    css=#password          ${user.password}
    Fill Text    css=#confirmPassword   ${user.password}
    Click        css=button[type="submit"]


Confirmar a página de cadastro
      Wait For Elements State    css=h1 >> text=Cadastro    visible    10
    Wait For Elements State    css=h1 >> text=Cadastro    enabled    10
    ${titulo}=    Get Text    css=h1 >> text=Cadastro
    Should Be Equal    ${titulo}    Cadastro  # confirmar titulo da pagina de cadastro




Confirmar a página de login
    Wait For Elements State    xpath=//h1[text()='Login']    visible    15
    Wait For Elements State    xpath=//h1[text()='Login']    enabled    15
    ${titulo}=    Get Text    xpath=//h1[text()='Login']
    Should Be Equal    ${titulo}    Login



 Realizar login
    [Arguments]        ${user}
    Fill Text    css=#email             ${user.email}
    Fill Text    css=#password          ${user.password}
    Wait For Elements State    css=button[type="submit"]    visible    15
    Wait For Elements State    css=button[type="submit"]    enabled    15
    Click        css=button[type="submit"]



 Confirmar login com sucesso
    Wait For Elements State    text=Login realizado com sucesso!    visible    15



Buscar filme
    Click    ${filmes_em_cartaz}



Confirmar página de buscar filmes
    Wait For Elements State    ${titulo_filmes_em_cartaz}    visible    10
    Wait For Elements State    ${titulo_filmes_em_cartaz}    enabled    10
    ${titulo}=    Get Text    ${titulo_filmes_em_cartaz}
    Should Be Equal    ${titulo}    Filmes em Cartaz

Pesquisar filme
    Fill Text    ${buscar_filme}      The Avengers
    Press Keys   ${buscar_filme}
    Wait For Elements State    text=The Avengers    visible    20

Ver detalhes do filme 
    Wait For Elements State     text=The Avengers    visible    20
    Click    ${detalhes_filme}
    

Confirmar pagina de sessôes    
    Wait For Elements State    ${filme}    visible    10
    ${titulo}=    Get Text    ${filme}
    Should Be Equal    ${titulo}    The Avengers
    Wait For Elements State    ${sessoes_disponiveis}   visible    10
    ${subtitulo}=    Get Text    ${sessoes_disponiveis}
    Should Be Equal    ${subtitulo}    Sessões Disponíveis
    Wait For Elements State    ${clicar_sessao}  visible    20
    # Clica no primeiro botão "Selecionar Assentos"
    Click    ${clicar_sessao}

Selecionar assentos
    #${clicar_poltrona}=    Gerar Locator
    #Log    Poltrona selecionada: ${clicar_poltrona}
    Click    ${clicar_poltrona}
    Wait For Elements State    ${continuar_para_pagamento}    visible    10
    Click    ${continuar_para_pagamento}


Realizar pagamento     
      Wait For Elements State    ${titulo_finalizar_compra}    visible    10
      ${titulo}=    Get Text    ${titulo_finalizar_compra}
      Should Be Equal    ${titulo}    Finalizar Compra
      Click    ${botao_finalizar_compra}


Confirmar reserva      
    Wait For Elements State    ${alerta_confirmar_reserva}   visible    10
    ${titulo}=    Get Text    ${alerta_confirmar_reserva}
    Should Be Equal    ${titulo}    Reserva Confirmada!



Liberar assentos    
    Wait For Elements State    ${liberar_assentos}    visible    15
    Wait For Elements State    ${liberar_assentos}    enabled    15
    Click    ${liberar_assentos}



Realizar logout
    Wait For Elements State    ${botao_logout}   visible    10s
    Click    ${botao_logout}
    