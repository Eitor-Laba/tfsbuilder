#!/bin/bash

# Nome do serviço ou container
SERVICE_NAME="tfsbuilder"
CONTAINER_NAME="tfsbuilder"

# Pasta do host onde o binário vai ficar
HOST_BIN_DIR="./bin"

# Caminho do binário dentro do container
CONTAINER_BIN_PATH="/home/3777-master/bin/theforgottenserver"

# Gera nome com data e hora atual
CURRENT_DATE=$(date +"%Y%m%d_%H%M%S")
HOST_BIN_PATH="$HOST_BIN_DIR/theforgottenserver_$CURRENT_DATE"

# 1️⃣ Build do container
echo "Construindo a imagem do container..."
docker-compose build "$SERVICE_NAME"

# 3️⃣ Cria pasta bin no host
mkdir -p "$HOST_BIN_DIR"

# 4️⃣ Roda o container temporariamente para garantir que o binário seja criado
echo "Rodando o container temporário..."
docker run --name "$CONTAINER_NAME" "$SERVICE_NAME"

# 5️⃣ Copia o binário para o host
echo "Copiando theforgottenserver para $HOST_BIN_DIR..."
    echo "Arquivo salvo como: $HOST_BIN_PATH"

echo "Build e cópia concluídas com sucesso!"
