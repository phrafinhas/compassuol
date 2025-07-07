*** Variables ***

${titulo_filmes_em_cartaz}=    xpath=//h1[text()='Filmes em Cartaz']

${buscar_filme}=    xpath=//input[@placeholder="Buscar filmes..."] 

${detalhes_filme}=    xpath=//div[@class="movie-card"][.//h3[text()="The Avengers"]]//a[text()="Ver Detalhes"]

# página inicial do usuário

${filmes_em_cartaz}=       xpath=//a[text()='Ver todos os filmes em cartaz']