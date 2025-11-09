#!/bin/bash

# Nome do serviço ou container
SERVICE_NAME="tfsbuilder"
CONTAINER_NAME="tfsbuilder"

# Gera nome com data e hora atual
CURRENT_DATE=$(date +"%d.%m.%Y_%S.%M.%H")
HOST_BIN_PATH="../Fireline/3777/theforgottenserver_$CURRENT_DATE"

# 1️⃣ Build do container
echo "Construindo a imagem do container..."
docker-compose build "$SERVICE_NAME"

# 3️⃣ Cria pasta bin no host
mkdir -p "$HOST_BIN_DIR"

# 5️⃣ Copia o binário para o host
echo "Copiando theforgottenserver para $HOST_BIN_PATH..."

docker-compose up

docker cp tfsbuilder:/home/3777-master/build/theforgottenserver $HOST_BIN_PATH

echo "Arquivo salvo como: $HOST_BIN_PATH"

echo "👌 Build e cópia concluídas com sucesso!"