*** Settings ***
Documentation        Keywords reutilizáveis 
Library        Browser


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
    Wait For Elements State    xpath=//h1[text()='Login']    visible    10
    Wait For Elements State    xpath=//h1[text()='Login']    enabled    10
    ${titulo}=    Get Text    xpath=//h1[text()='Login']
    Should Be Equal    ${titulo}    Login



 Realizar login
    [Arguments]        ${user}
    Fill Text    css=#email             ${user.email}
    Fill Text    css=#password          ${user.password}
    Wait For Elements State    css=button[type="submit"]    visible    10
    Wait For Elements State    css=button[type="submit"]    enabled    10
    Click        css=button[type="submit"]
   


 Confirmar login com sucesso
    Wait For Elements State    text=Login realizado com sucesso!    visible    10
