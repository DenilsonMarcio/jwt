# 📝 Guia de Uso - Endpoint de Registro de Usuário

## ✅ Alterações Implementadas

### 1. **Endpoint de Registro Público**
- **URL**: `POST /api/auth/register`
- **Descrição**: Permite que novos usuários se registrem sem autenticação
- **Sem require**: Token JWT não é necessário para este endpoint

### 2. **Arquivo de Inicialização de Dados**
- **Localização**: `src/main/resources/data.sql`
- **Função**: Popula automaticamente o banco H2 com usuários de teste quando a aplicação inicia
- **Usuários de teste pré-carregados**:
  - Username: `admin` | Password: `admin123` | Email: `admin@example.com`
  - Username: `user` | Password: `user123` | Email: `user@example.com`

### 3. **Configuração de Auto-inicialização**
- **Arquivo**: `application.properties`
- **Propriedades adicionadas**:
  ```properties
  spring.sql.init.mode=always
  spring.sql.init.data-locations=classpath:data.sql
  ```

---

## 🧪 Como Testar

### Opção 1: Via Swagger UI (Recomendado)
1. Acesse: `http://localhost:8080/swagger-ui.html`
2. Localize o endpoint **POST /api/auth/register**
3. Clique em "Try it out"
4. Preencha o corpo da requisição com um novo usuário:
```json
{
  "username": "novo_usuario",
  "password": "senha123",
  "email": "novo@example.com"
}
```
5. Clique em "Execute"

### Opção 2: Via cURL
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "novo_usuario",
    "password": "senha123",
    "email": "novo@example.com"
  }'
```

### Opção 3: Via Postman
1. Crie uma nova requisição POST
2. URL: `http://localhost:8080/api/auth/register`
3. Headers: `Content-Type: application/json`
4. Body (JSON):
```json
{
  "username": "novo_usuario",
  "password": "senha123",
  "email": "novo@example.com"
}
```

---

## 📋 Resposta da API

### ✅ Sucesso (HTTP 201)
```json
{
  "id": 1,
  "username": "novo_usuario",
  "email": "novo@example.com",
  "message": "Usuário registrado com sucesso!"
}
```

### ❌ Erro (HTTP 400)
```json
{
  "id": null,
  "username": null,
  "email": null,
  "message": "Usuário ou e-mail já cadastrado"
}
```

---

## 🔐 Fluxo Completo: Registro → Login → Acesso à API

### 1️⃣ Registrar novo usuário
```bash
POST /api/auth/register
{
  "username": "joao",
  "password": "senha123",
  "email": "joao@example.com"
}
```

### 2️⃣ Fazer login (obter token JWT)
```bash
POST /api/auth/login
{
  "username": "joao",
  "password": "senha123"
}
```
**Resposta**: Token JWT válido por 1 hora

### 3️⃣ Usar o token para acessar endpoints protegidos
```bash
GET /api/users (exemplo)
Authorization: Bearer <seu_token_jwt_aqui>
```

---

## 📊 Informações do Banco de Dados H2

### Acesso ao Console H2
- **URL**: `http://localhost:8080/h2-console`
- **Driver**: `org.h2.Driver`
- **URL JDBC**: `jdbc:h2:mem:testdb`
- **Username**: `sa`
- **Password**: (vazio)

### Tabela de Usuários
```sql
CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL
)
```

---

## ✨ Melhorias Implementadas

1. ✅ **Endpoint de Registro Público**: Qualquer pessoa pode registrar uma nova conta
2. ✅ **Data.sql**: Banco inicializa com usuários de teste automaticamente
3. ✅ **Resposta Estruturada**: DTO padrão para respostas de registro
4. ✅ **Tratamento de Erros**: Validações de username e email duplicados
5. ✅ **Documentação Swagger**: Endpoints documentados e testáveis via UI
6. ✅ **Lombok**: Anotações @Data para reduzir boilerplate

---

## 🚀 Próximas Execuções

Quando a aplicação é reiniciada:
- ✅ Base H2 é recriada automaticamente
- ✅ Dados do `data.sql` são carregados automaticamente
- ✅ Usuários de teste estão prontos para login imediatamente

**Nenhum usuário precisa ser registrado manualmente na primeira inicialização!**


