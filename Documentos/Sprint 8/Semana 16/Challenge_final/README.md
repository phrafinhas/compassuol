# Projeto de Testes Automatizados - Challenge Final | PB AWS & AI for QE

## Participante

- **Nome:** Raphael Rodrigues  
- **Curso:** Engenharia de Software

## Tecnologias Utilizadas

- Robot Framework  
- Browser Library (Playwright)  
- FakerLibrary  
- Postman  
- Jira  
- Node.js  
- Python (biblioteca customizada)

## Funcionalidades Testadas

- Cadastro de usuário  
- Login de usuário  
- Reserva de filme (fluxo completo)

## Execução Local

1. Instale as dependências:

```bash
pip install -r requirements.txt
```

2. Suba o servidor local:

```bash
npm install
npm start
```

> A aplicação roda em: **http://localhost:3002**

3. Execute os testes:

```bash
cd "C:\Users\compassuol\Documentos\Sprint 8\Semana 16\Challenge_final\Testes_automatizados"
robot -d /logs tests/
```

## Estrutura do Projeto

```
Testes_automatizados/
├── tests/
│   ├── cadastro/
│   │   └── test_cadastro_usuario.robot
│   ├── login/
│   │   └── test_login_usuario.robot
│   ├── reserva/
│   │   └── test_reserva_filme.robot
│   └── tests.robot
│
├── resources/
│   ├── data/
│   │   ├── RandomUser.robot
│   │   └── UserFixture.robot
│   ├── locators/
│   │   ├── FilmesLocators.robot
│   │   ├── PagamentoLocators.robot
│   │   ├── ReservaLocators.robot
│   │   └── SessaoLocators.robot
│   ├── pages/
│   │   ├── CadastroPage.robot
│   │   ├── FilmesPage.robot
│   │   ├── LoginPage.robot
│   │   ├── PagamentoPage.robot
│   │   ├── ReservaPage.robot
│   │   └── SessaoPage.robot
│   └── variables/
│       ├── env.resource
│       └── Keywords.resource
│
├── libraries/
│   └── PoltronaSequencial.py
│
├── browser/
│   ├── screenshot/
│   └── traces/
│
├── logs/
│   ├── log.html
│   ├── output.xml
│   ├── report.html
│   └── playwright-log.txt
│
└── README.md
```