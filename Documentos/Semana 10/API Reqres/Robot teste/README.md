# 🚀 Testes Automatizados da API ReqRes

Este projeto contém testes automatizados da API pública [ReqRes](https://reqres.in/), uma API fake usada para praticar requisições REST. Os testes foram criados usando **Robot Framework** para garantir que as operações básicas da API estão funcionando corretamente.

---

## 🧪 O que testamos?

1. **Registrar Usuário com Dados Válidos** ✅  
   - Envia email e senha válidos para registrar um novo usuário.  
   - Verifica se o servidor retorna o código `200 OK` e um token no corpo da resposta.

2. **Registrar Usuário com Dados Incompletos** ⚠️  
   - Tenta registrar usuário sem email e senha.  
   - Espera receber erro `400 Bad Request` e mensagem de erro informando dados faltantes.

3. **Obter Usuários** 🔍  
   - Faz uma requisição para listar usuários cadastrados.  
   - Verifica se o código retornado é `200 OK`.

4. **Deletar Usuário** 🗑️  
   - Deleta um usuário existente pelo seu ID.  
   - Espera o código `204 No Content`, confirmando exclusão bem-sucedida.

5. **Atualizar Usuário com PUT** ✏️  
   - Atualiza os dados (nome e cargo) de um usuário específico.  
   - Valida se o código é `200 OK` e se a data da atualização (`updatedAt`) está presente no retorno.

---

## ⚙️ Tecnologias usadas

- **Robot Framework** - ferramenta para automação de testes  
- **RequestsLibrary** - biblioteca Robot para requisições HTTP  
- API pública [ReqRes](https://reqres.in/)

---

## 📋 Como rodar os testes

1. Instale o Robot Framework e RequestsLibrary:
   ```bash
   pip install robotframework
   pip install robotframework-requests
   execute :   robot tests.robot
