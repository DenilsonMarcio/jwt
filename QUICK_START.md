# ⚡ QUICK START - Guia Rápido

## 🚀 Inicializar em 3 Passos

### 1️⃣ Compilar o Projeto
```bash
cd C:\Users\denil\jwt
mvnw.cmd clean package -DskipTests
```

### 2️⃣ Executar a Aplicação
```bash
java -jar target\jwt-0.0.1-SNAPSHOT.jar
```

### 3️⃣ Acessar a API
```
Swagger UI: http://localhost:8080/swagger-ui.html
```

---

## 📝 Registrar um Novo Usuário (5 segundos)

### Via Swagger UI (Recomendado)
1. Abra: `http://localhost:8080/swagger-ui.html`
2. Expanda: **POST /api/auth/register**
3. Clique em: **"Try it out"**
4. Cole este JSON:
```json
{
  "username": "seu_usuario",
  "password": "sua_senha",
  "email": "seu@email.com"
}
```
5. Clique: **"Execute"**

### Via cURL
```bash
curl -X POST http://localhost:8080/api/auth/register ^
  -H "Content-Type: application/json" ^
  -d "{\"username\":\"seu_usuario\",\"password\":\"sua_senha\",\"email\":\"seu@email.com\"}"
```

---

## 🔐 Fazer Login e Obter Token

### Via Swagger
1. Expanda: **POST /api/auth/login**
2. Cole este JSON:
```json
{
  "username": "seu_usuario",
  "password": "sua_senha"
}
```
3. Clique: **"Execute"**
4. Copie o token retornado

---

## 👤 Usuários Pré-carregados (Sem Registrar)

Ao iniciar, você já tem esses usuários disponíveis:

| Username | Password | Email |
|----------|----------|-------|
| `admin` | `admin123` | admin@example.com |
| `user` | `user123` | user@example.com |

Use-os para testar imediatamente sem registrar!

---

## 🗄️ Acessar o Banco de Dados H2

```
URL: http://localhost:8080/h2-console

Driver: org.h2.Driver
URL JDBC: jdbc:h2:mem:testdb
Username: sa
Password: (deixe em branco)
```

Clique em "Connect" e veja as tabelas!

---

## 📚 Documentação Completa

| Arquivo | Descrição |
|---------|-----------|
| `README_API.md` | 📖 Documentação completa |
| `REGISTRO_USUARIOS.md` | 👤 Guia de registro |
| `ALTERACOES.md` | 📋 Resumo de mudanças |
| `exemplos_requisicoes.json` | 📝 Exemplos JSON |
| `testar_api.sh` | 🧪 Script de testes |

---

## ⚠️ Problemas Comuns

### ❌ Porta 8080 em uso
```bash
# Verifique qual processo está usando
netstat -ano | findstr :8080

# Mude a porta em application.properties
server.port=8081
```

### ❌ Java não encontrado
```bash
# Verifique se Java 21+ está instalado
java -version

# Instale Java de: https://www.oracle.com/java/technologies/downloads/
```

### ❌ Maven não funciona
```bash
# Use o mvnw.cmd incluído no projeto
mvnw.cmd clean package
```

---

## 🎯 Próximos Passos

1. ✅ Inicie a aplicação
2. ✅ Acesse http://localhost:8080/swagger-ui.html
3. ✅ Registre um novo usuário OU use admin/admin123
4. ✅ Faça login e obtenha o token
5. ✅ Teste os endpoints protegidos
6. ✅ Explore o banco H2 Console

---

## 💡 Dicas Úteis

- 📌 **Swagger UI** é a melhor forma de testar a API
- 📌 Tokens JWT expiram em **1 hora**
- 📌 Todos os dados são perdidos ao **reiniciar** a aplicação
- 📌 Use os usuários pré-carregados para testes rápidos
- 📌 Emails devem ser únicos (um por usuário)
- 📌 Usernames devem ter **mínimo 3 caracteres**
- 📌 Senhas devem ter **mínimo 6 caracteres**

---

## 🔗 URLs Importantes

```
Swagger UI:        http://localhost:8080/swagger-ui.html
H2 Console:        http://localhost:8080/h2-console
API Docs:          http://localhost:8080/v3/api-docs
Registrar:         POST /api/auth/register
Login:             POST /api/auth/login
Ver Usuários:      GET /api/users (requer token)
```

---

## 🎓 Exemplo Completo

```bash
# 1. Registrar
curl -X POST http://localhost:8080/api/auth/register ^
  -H "Content-Type: application/json" ^
  -d "{\"username\":\"joao\",\"password\":\"senha123\",\"email\":\"joao@email.com\"}"

# 2. Login
curl -X POST http://localhost:8080/api/auth/login ^
  -H "Content-Type: application/json" ^
  -d "{\"username\":\"joao\",\"password\":\"senha123\"}"

# 3. Usar token (substitua TOKEN pelo retornado em Login)
curl -X GET http://localhost:8080/api/users ^
  -H "Authorization: Bearer TOKEN"
```

---

**Dúvidas? Consulte os arquivos README_API.md ou REGISTRO_USUARIOS.md!**

