#!/bin/bash

# Script para configurar n8n con permisos correctos
echo "🔧 Configurando permisos para n8n..."

# Crear directorio si no existe
mkdir -p n8n_data

# Configurar permisos correctos
sudo chown -R 1000:1000 n8n_data/
sudo chmod -R 755 n8n_data/

echo "✅ Permisos configurados correctamente"
echo "🚀 Iniciando n8n con docker-compose..."

# Iniciar los servicios
docker-compose up -d

echo "🎉 n8n está listo!"
echo "📱 Accede a: http://localhost:5678"
