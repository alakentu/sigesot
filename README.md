# SIGESOT - Sistema de Gestión de Soporte Técnico

![CodeIgniter](https://img.shields.io/badge/CodeIgniter-%23EF4223.svg?style=for-the-badge&logo=codeIgniter&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)

Sistema para gestionar solicitudes de soporte técnico con seguimiento y resolución de problemas.

---

## 📋 Requisitos Técnicos
- **Servidor**: XAMPP (Windows/Linux/macOS)
- **PHP**: 8.3+ con extensión `pgsql`
- **PostgreSQL**: 16+
- **PgAdmin 4**: Para administración de BD
- **Navegador**: Chrome/Firefox/Edge actualizado

---

## 🛠 Instalación Paso a Paso

### 1. Configuración Inicial
1. **Instalar XAMPP**:
   - Descargar desde [Apache Friends](https://www.apachefriends.org/)
   - Activar PHP 8.3+ durante la instalación

2. **Instalar PostgreSQL 16**:
   ```bash
   # En Linux (Debian/Ubuntu):
   sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
   wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
   sudo apt-get update
   sudo apt-get install postgresql-16```

3. **Habilitar extensión pgsql**:
- **Editar php.ini**: extension=pgsql
- **Reiniciar Apache**

4. **Configuración de la Base de Datos**:
- **Crear usuario y Base de Datos**
- **Restaurar Base de Datos desde el archivo**: /sql/scheme.backup (usando PgAdmin 4) ó desde el terminal el archivo /sql/scheme.sql

5. **Usuarios de Prueba**	
| Rol           | Usuario | Contraseña |
|---------------|---------|------------|
| Administrador | admin   | 12345678*  |
| Gestor        | gestor  | 12345678*  |

6. **Acceso al Sistema**
- **URL**: http://localhost/sigesot/public/
- **Primer acceso**: Usar credenciales de prueba anteriores

7. **Notas Importantes**
- **No compartir el archivo .env**
- **Cambiar contraseñas en producción**