# Testes Automatizados da API ReqRes

Este projeto contém testes automatizados da API pública [ReqRes](https://reqres.in/), uma API REST para testes e prototipação. Os testes foram implementados usando **Robot Framework** para validar as operações CRUD e autenticação da API.

## Sobre o Projeto

O projeto consiste em testes automatizados que validam as seguintes operações na API ReqRes:
- Registro de usuários
- Login de usuários
- Consulta de usuários (lista e individual)
- Atualização de usuários (PUT e PATCH)
- Exclusão de usuários

## Melhorias Implementadas com Amazon Q

O código foi otimizado com a ajuda do Amazon Q, realizando as seguintes melhorias:

1. **Correção de Referências Circulares**:
   - Removidas referências circulares entre arquivos de keywords e testes
   - Eliminados problemas de importação que causavam falhas na execução

2. **Atualização de Sintaxe Depreciada**:
   - Substituição da sintaxe `[Return]` pela nova sintaxe `RETURN` em todos os keywords
   - Adequação ao padrão do Robot Framework 7.x

3. **Adição de Bibliotecas Necessárias**:
   - Inclusão das bibliotecas `RequestsLibrary` e `Collections` em todos os arquivos de keywords

## Estrutura do Projeto

```
Robot teste/
├── keywords/         # Keywords organizadas por tipo de operação
├── support/          # Arquivos de configuração
├── testes/           # Casos de teste
└── results/          # Relatórios de execução
```

## Como Executar os Testes

Para executar os testes, navegue até o diretório do projeto e execute:

```bash
# Navegue até o diretório do projeto
cd "Robot teste"

# Execute todos os testes
robot -d results testes/tests.robot

# Execute testes por tag específica
robot -d results -i positivo testes/tests.robot
robot -d results -i registro testes/tests.robot
```

## Requisitos

- Robot Framework 7.x
- Python 3.x
- Biblioteca RequestsLibrary

## Tags Disponíveis

- `registro`: Testes de registro de usuários
- `autenticacao`: Testes de login
- `consulta`: Testes de obtenção de dados
- `atualizacao`: Testes de atualização de dados
- `exclusao`: Testes de exclusão
- `positivo`: Testes de cenários de sucesso
- `negativo`: Testes de cenários de falha