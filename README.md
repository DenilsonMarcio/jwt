# 🚀 API JWT Spring Boot

## 📝 Visão Geral
API de autenticação e autorização usando JWT, Spring Boot, JPA, H2, Spring Security, validação, Swagger, SOLID e Clean Code.

## 🛠️ Tecnologias
- ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?logo=springboot&logoColor=white)
- ![Spring Security](https://img.shields.io/badge/Spring%20Security-6DB33F?logo=springsecurity&logoColor=white)
- ![JWT](https://img.shields.io/badge/JWT-000000?logo=jsonwebtokens&logoColor=white)
- ![JPA](https://img.shields.io/badge/JPA-007396?logo=hibernate&logoColor=white)
- ![H2 Database](https://img.shields.io/badge/H2-1a73e8?logo=h2&logoColor=white)
- ![Swagger](https://img.shields.io/badge/Swagger-85EA2D?logo=swagger&logoColor=black)
- ![JUnit](https://img.shields.io/badge/JUnit-25A162?logo=junit5&logoColor=white)
- ![Mockito](https://img.shields.io/badge/Mockito-FFC107?logo=mockito&logoColor=black)

## 📦 Endpoints

### 🔐 Autenticação
- `POST /api/auth/register` — Cadastro de usuário
  - Body: `{ "username": "string", "password": "string", "email": "string" }`
- `POST /api/auth/login` — Login
  - Body: `{ "username": "string", "password": "string" }`
  - Retorna: JWT Token

### 👤 Usuário
- `GET /api/user/me` — Dados do usuário autenticado
  - Header: `Authorization: Bearer <token>`

## 🧪 Testes
- Testes unitários e de serviço com JUnit e Mockito em `src/test/java`

## ✅ Validação
- Validação automática dos campos via Spring Validator

## 🗄️ Banco de Dados
- H2 em memória, console acessível em `/h2-console`

## 🔒 Segurança
- Endpoints protegidos por JWT
- Senhas criptografadas com BCrypt

## 📚 Swagger
- Documentação e testes via navegador em `/swagger-ui.html`

## ⚙️ Como configurar e rodar
1. Instale **Java 21+** e **Maven**
2. Clone o projeto:
   ```bash
   git clone <url-do-repositorio>
   cd jwt
   ```
3. Execute:
   ```bash
   mvnw spring-boot:run
   # ou
   mvn spring-boot:run
   ```
4. Acesse:
   - Swagger: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
   - H2 Console: [http://localhost:8080/h2-console](http://localhost:8080/h2-console)

## 🧑‍💻 Como testar no Swagger
1. Cadastre um usuário via `/api/auth/register`
2. Faça login via `/api/auth/login` e copie o token JWT retornado
3. Clique em **Authorize** no topo do Swagger UI e cole o token no formato:
   ```
   Bearer <seu-token-jwt>
   ```
4. Teste o endpoint `/api/user/me` para ver os dados do usuário autenticado

## 💡 Observações
- Código segue princípios **SOLID** e **Clean Code**
- Validação automática
- Testes inclusos
- Documentação interativa via Swagger
- Hot reload com Spring Boot DevTools

---

> Feito com ❤️ usando Spring Boot, JWT e boas práticas de desenvolvimento!
