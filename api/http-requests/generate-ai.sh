#!/bin/bash

URL="http://127.0.0.1:3001/ai/generate"

# JSON a ser enviado
JSON_DATA='{
  "videoId": "<id do video>",
  "temperature: 0.3",
  "template:"Gere um resumo sucinto da trancrição do video informada a seguir: '''{trancription}'''"
}'

# Use o curl para enviar o JSON com o método POST
curl -X POST -H "Content-Type: application/json" -d "$JSON_DATA" "$URL"

# Verifique o código de resposta do servidor, se necessário
HTTP_STATUS=$?
if [ $HTTP_STATUS -eq 0 ]; then
  echo "Erro: Curl não conseguiu se conectar ao servidor."
else
  if [ $HTTP_STATUS -ne 200 ]; then
    echo "Erro: O servidor retornou um código de status HTTP $HTTP_STATUS"
  else
    echo "sucesso ao enviar!"
  fi
fi
