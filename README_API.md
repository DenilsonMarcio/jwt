# 🔐 JWT Authentication API - Spring Boot

Aplicação Spring Boot com autenticação baseada em JWT, registro de usuários e banco de dados H2 em memória.

## 📋 Sumário das Alterações

### ✅ Novos Recursos Implementados

1. **Endpoint de Registro Público** (`POST /api/auth/register`)
   - Permite registrar novos usuários sem autenticação
   - Validações automáticas de username e email duplicados
   - Resposta estruturada com DTO

2. **Inicialização Automática de Dados** (`data.sql`)
   - Banco H2 é populado automaticamente na inicialização
   - Usuários de teste pré-carregados
   - Nenhuma necessidade de cadastro manual na primeira execução

3. **Melhorias na API**
   - Documentação Swagger completa
   - Tratamento de erros padronizado
   - Respostas estruturadas com DTOs

---

## 🚀 Iniciando a Aplicação

### Pré-requisitos
- Java 21 ou superior
- Maven (incluído via mvnw)

### Passos para Inicializar

1. **Clone ou acesse o repositório**
```bash
cd C:\Users\denil\jwt
```

2. **Compile o projeto**
```bash
mvnw.cmd clean package -DskipTests
```

3. **Execute a aplicação**
```bash
java -jar target/jwt-0.0.1-SNAPSHOT.jar
```

A aplicação estará disponível em: `http://localhost:8080`

---

## 🧪 Testando a API

### Opção 1: Swagger UI (Recomendado) ⭐
```
http://localhost:8080/swagger-ui.html
```
Interface interativa para testar todos os endpoints da API.

### Opção 2: Exemplos de Requisições

#### Registrar novo usuário
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "novo_usuario",
    "password": "senha123",
    "email": "novo@example.com"
  }'
```

#### Fazer login
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "admin123"
  }'
```

#### Acessar endpoint protegido
```bash
curl -X GET http://localhost:8080/api/users \
  -H "Authorization: Bearer <SEU_TOKEN_JWT>"
```

---

## 👥 Usuários de Teste Pré-carregados

Ao iniciar a aplicação, os seguintes usuários estão automaticamente disponíveis:

| Username | Password | Email |
|----------|----------|-------|
| admin | admin123 | admin@example.com |
| user | user123 | user@example.com |

Você pode login com qualquer um desses usuários ou registrar novos.

---

## 📊 Banco de Dados H2

### Acesso ao Console H2
```
http://localhost:8080/h2-console
```

**Credenciais:**
- **Driver**: `org.h2.Driver`
- **URL JDBC**: `jdbc:h2:mem:testdb`
- **Username**: `sa`
- **Password**: (deixe em branco)

### Tabelas
```sql
-- Tabela de Usuários
CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL
);
```

---

## 🔐 Fluxo de Autenticação

### 1️⃣ Registrar Usuário
```
POST /api/auth/register
```
**Payload:**
```json
{
  "username": "joao_silva",
  "password": "senha123",
  "email": "joao@example.com"
}
```

**Resposta (201 Created):**
```json
{
  "id": 3,
  "username": "joao_silva",
  "email": "joao@example.com",
  "message": "Usuário registrado com sucesso!"
}
```

### 2️⃣ Fazer Login
```
POST /api/auth/login
```
**Payload:**
```json
{
  "username": "joao_silva",
  "password": "senha123"
}
```

**Resposta (200 OK):**
```
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqb2FvX3NpbHZhIiwiaWF0IjoxNjc4MzkyMDE3LCJleHAiOjE2Nzg0MzUyMTd9.abc123...
```

### 3️⃣ Acessar Recursos Protegidos
```
GET /api/users
Authorization: Bearer <SEU_TOKEN>
```

---

## 📁 Estrutura do Projeto

```
src/
├── main/
│   ├── java/com/example/jwt/
│   │   ├── JwtApplication.java
│   │   ├── JwtAuthenticationFilter.java
│   │   ├── config/
│   │   │   ├── SecurityConfig.java
│   │   │   └── SwaggerConfig.java
│   │   ├── controller/
│   │   │   ├── AuthController.java
│   │   │   └── UserController.java
│   │   ├── dto/
│   │   │   ├── UserLoginDTO.java
│   │   │   ├── UserRegisterDTO.java
│   │   │   └── UserResponseDTO.java
│   │   ├── model/
│   │   │   └── User.java
│   │   ├── repository/
│   │   │   └── UserRepository.java
│   │   └── service/
│   │       ├── JwtService.java
│   │       └── UserService.java
│   └── resources/
│       ├── application.properties
│       └── data.sql
└── test/
    └── java/com/example/jwt/
```

---

## 🔧 Arquivos de Configuração

### application.properties
```properties
# H2 Database
spring.datasource.url=jdbc:h2:mem:testdb
spring.datasource.driverClassName=org.h2.Driver
spring.jpa.hibernate.ddl-auto=update

# Inicializar dados de teste
spring.sql.init.mode=always
spring.sql.init.data-locations=classpath:data.sql

# Swagger
springdoc.api-docs.path=/v3/api-docs
springdoc.swagger-ui.path=/swagger-ui.html

# H2 Console
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console
```

### data.sql
Contém scripts SQL para inicializar usuários de teste automaticamente.

---

## 📦 Dependências Principais

- **Spring Boot 3.5.7**
- **Spring Security**
- **JWT (JJWT 0.11.5)**
- **Spring Data JPA**
- **H2 Database**
- **SpringDoc OpenAPI (Swagger)**
- **Lombok**

---

## 🔗 URLs Importantes

| Recurso | URL |
|---------|-----|
| Swagger UI | `http://localhost:8080/swagger-ui.html` |
| API Docs | `http://localhost:8080/v3/api-docs` |
| H2 Console | `http://localhost:8080/h2-console` |
| Login | `POST http://localhost:8080/api/auth/login` |
| Registrar | `POST http://localhost:8080/api/auth/register` |

---

## ⚙️ Endpoints da API

### Autenticação (Públicos)
- `POST /api/auth/register` - Registrar novo usuário
- `POST /api/auth/login` - Fazer login e obter token JWT

### Usuários (Protegidos)
- `GET /api/users` - Listar todos os usuários
- `GET /api/users/{id}` - Obter usuário por ID
- `PUT /api/users/{id}` - Atualizar usuário
- `DELETE /api/users/{id}` - Deletar usuário

---

## 🐛 Troubleshooting

### A aplicação não inicia
- Verifique se a porta 8080 está disponível
- Confirme que Java 21+ está instalado: `java -version`

### Token inválido
- Verifique se o token foi copiado completamente
- Tokens expiram após 1 hora de uso
- Faça login novamente para obter um novo token

### Usuário não encontrado
- Verifique o username (case-sensitive)
- Confirme a senha está correta
- Na primeira inicialização, use `admin` / `admin123`

---

## 📚 Arquivos de Referência

- `REGISTRO_USUARIOS.md` - Guia detalhado de registro de usuários
- `exemplos_requisicoes.json` - Exemplos de requisições em JSON
- `testar_api.sh` - Script bash com exemplos de testes

---

## 🎯 Próximos Passos

1. ✅ Registrar um novo usuário via `/api/auth/register`
2. ✅ Fazer login para obter o token JWT
3. ✅ Usar o token para acessar endpoints protegidos
4. ✅ Explorar a API via Swagger UI

---

## 📝 Notas Importantes

- **Banco de dados em memória**: Todos os dados são perdidos ao reiniciar a aplicação
- **Dados iniciais**: Usuários de teste são recarregados automaticamente do `data.sql`
- **Segurança**: Em produção, configure variáveis de ambiente para secrets e JWT key
- **Swagger**: Todos os endpoints são documentados e testáveis no Swagger UI

---

**Desenvolvido com ❤️ usando Spring Boot e JWT**

