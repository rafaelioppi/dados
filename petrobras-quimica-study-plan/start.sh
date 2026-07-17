#!/bin/bash
cd "$(dirname "$0")"
echo "🚀 Iniciando Petrobras Study Tracker..."

if [ ! -d node_modules ]; then
  echo "📦 Instalando dependencias..."
  npm install
fi

if command -v lsof &>/dev/null; then
  PID=$(lsof -ti:3000)
  if [ -n "$PID" ]; then
    echo "🔒 Encerrando processo na porta 3000 (PID: $PID)..."
    kill -9 $PID 2>/dev/null
  fi
fi

node server.js
