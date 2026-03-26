#!/bin/bash
# Script com exemplos de requisições para testar a API JWT

echo "===== API JWT - Exemplos de Requisições ====="
echo ""

# URL base
API_URL="http://localhost:8080"

# ============================================
# 1. REGISTRAR NOVO USUÁRIO
# ============================================
echo "1️⃣  Registrando novo usuário..."
echo "Requisição:"
echo "POST /api/auth/register"
echo ""

curl -X POST "${API_URL}/api/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "maria_santos",
    "password": "senha_segura_456",
    "email": "maria@example.com"
  }' \
  -w "\nStatus: %{http_code}\n" \
  -s | jq '.'

echo ""
echo "---"
echo ""

# ============================================
# 2. FAZER LOGIN COM USUÁRIO REGISTRADO
# ============================================
echo "2️⃣  Fazendo login..."
echo "Requisição:"
echo "POST /api/auth/login"
echo ""

RESPONSE=$(curl -X POST "${API_URL}/api/auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "maria_santos",
    "password": "senha_segura_456"
  }' \
  -w "\n%{http_code}" \
  -s)

# Extrair token e status
HTTP_STATUS=$(echo "$RESPONSE" | tail -n 1)
TOKEN=$(echo "$RESPONSE" | head -n -1 | sed 's/"//g')

echo "Resposta:"
echo "Status: $HTTP_STATUS"
echo "Token: $TOKEN"
echo ""
echo "---"
echo ""

# ============================================
# 3. FAZER LOGIN COM USUÁRIO DE TESTE
# ============================================
echo "3️⃣  Fazendo login com usuário pré-carregado (admin)..."
echo "Requisição:"
echo "POST /api/auth/login"
echo ""

RESPONSE=$(curl -X POST "${API_URL}/api/auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "admin123"
  }' \
  -w "\n%{http_code}" \
  -s)

HTTP_STATUS=$(echo "$RESPONSE" | tail -n 1)
TOKEN=$(echo "$RESPONSE" | head -n -1 | sed 's/"//g')

echo "Resposta:"
echo "Status: $HTTP_STATUS"
echo "Token: $TOKEN"
echo ""
echo "---"
echo ""

# ============================================
# 4. ACESSAR ENDPOINT PROTEGIDO
# ============================================
echo "4️⃣  Acessando endpoint protegido com token..."
echo "Requisição:"
echo "GET /api/users"
echo "Authorization: Bearer $TOKEN"
echo ""

curl -X GET "${API_URL}/api/users" \
  -H "Authorization: Bearer $TOKEN" \
  -w "\nStatus: %{http_code}\n" \
  -s | jq '.'

echo ""
echo "---"
echo ""

# ============================================
# 5. TENTAR ACESSAR SEM TOKEN (DEVE FALHAR)
# ============================================
echo "5️⃣  Tentando acessar sem token (deve falhar com 403)..."
echo "Requisição:"
echo "GET /api/users"
echo ""

curl -X GET "${API_URL}/api/users" \
  -w "\nStatus: %{http_code}\n" \
  -s

echo ""
echo "---"
echo ""

# ============================================
# 6. TENTAR REGISTRAR USUÁRIO DUPLICADO
# ============================================
echo "6️⃣  Tentando registrar usuário duplicado (deve falhar)..."
echo "Requisição:"
echo "POST /api/auth/register (com username já existente)"
echo ""

curl -X POST "${API_URL}/api/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "outra_senha",
    "email": "outro@example.com"
  }' \
  -w "\nStatus: %{http_code}\n" \
  -s | jq '.'

echo ""
echo "✅ Testes completos!"

