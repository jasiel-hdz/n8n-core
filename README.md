# n8n Core Setup

Este proyecto incluye una configuración de Docker Compose para n8n con configuración automática de permisos.

## 🚀 Inicio Rápido

### Opción 1: Usar el script de setup (Recomendado)
```bash
./setup.sh
```

### Opción 2: Comandos manuales
```bash
# Configurar permisos automáticamente
docker-compose up -d

# Ver logs
docker-compose logs -f n8n
```

## 📁 Estructura del Proyecto

- `docker-compose.yml` - Configuración de servicios con contenedor de inicialización
- `setup.sh` - Script para configuración automática
- `n8n_data/` - Directorio de datos de n8n (se crea automáticamente)
- `.env` - Variables de entorno

## 🔧 Características

- ✅ **Configuración automática de permisos**: El contenedor `n8n-init` configura automáticamente los permisos correctos
- ✅ **Sin errores de permisos**: No más errores `EACCES: permission denied`
- ✅ **Configuración persistente**: Los datos se mantienen entre reinicios
- ✅ **Acceso externo**: Configurado con ngrok para acceso remoto

## 🌐 Acceso

- **Local**: http://localhost:5678
- **Remoto**: Se muestra en los logs de ngrok

## 📝 Comandos Útiles

```bash
# Iniciar servicios
docker-compose up -d

# Ver logs
docker-compose logs -f n8n

# Detener servicios
docker-compose down

# Reiniciar servicios
docker-compose restart

# Ver estado de contenedores
docker-compose ps
```

## 🔒 Permisos

El sistema configura automáticamente:
- Usuario: `1000:1000` (compatible con el usuario del contenedor)
- Permisos: `755` para directorios, `644` para archivos
- Propietario: Usuario correcto para escritura

## 🆘 Solución de Problemas

Si encuentras problemas de permisos:

1. **Usar el script de setup**:
   ```bash
   ./setup.sh
   ```

2. **Configurar permisos manualmente**:
   ```bash
   sudo chown -R 1000:1000 n8n_data/
   sudo chmod -R 755 n8n_data/
   ```

3. **Reiniciar servicios**:
   ```bash
   docker-compose down && docker-compose up -d
   ```