#!/bin/bash

# URL do servidor HTTP onde você deseja enviar o arquivo MP3
URL="http://127.0.0.1:3001/videos"

# Caminho para o arquivo MP3 que você deseja enviar
FILE="/c/Users/rocha/Music/music.mp3"

# Use o curl para enviar o arquivo MP3 com o tipo de conteúdo multipart/form-data
curl -X POST "$URL" -F "arquivo=@$FILE"

# Verifique o código de resposta do servidor, se necessário
HTTP_STATUS=$?
if [ $HTTP_STATUS -eq 0 ]; then
  echo "Erro: Curl não conseguiu se conectar ao servidor."
else
  if [ $HTTP_STATUS -ne 200 ]; then
    echo "Erro: O servidor retornou um código de status HTTP $HTTP_STATUS"
  else
    echo "Arquivo MP3 enviado com sucesso!"
  fi
fi

# chmod +x upload.sh
# ./uplaod.sh
