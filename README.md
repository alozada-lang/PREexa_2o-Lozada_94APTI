# 🔐 SegurEmpresa ASI - Plataforma de Gestión de Ciberseguridad

![Status](https://img.shields.io/badge/Status-Pre--Examen-green)
![Security](https://img.shields.io/badge/Security-WAF%20Integrated-blue)

## 📝 Información General
* **Materia:** Administración de la Seguridad Informática (ASI)
* **Alumno:** Angel Lozada
* **Docente:** Hildeberto Tovar
* **Institución:** Universidad Insurgentes Sur 1
* **Proyecto:** `PREexa_2o-Lozada_94APTI`

---

## 🎯 Objetivo del Proyecto
Desarrollar e implementar una **Plataforma Digital Segura** para la administración de activos informáticos, legislación vigente y normativas de seguridad a nivel empresarial. El sistema no solo gestiona información (CRUD), sino que actúa como una primera línea de defensa mediante un Firewall de Aplicación Web (WAF) lógico.

## 🚀 Alcance Tecnológico
1. **Gestión de Datos (CRUD):** Altas, consultas, edición y borrado de tips, consejos y legislación de seguridad con una estructura de 5 campos relacionales.
2. **Capa de Seguridad (WAF):** Filtrado de peticiones en tiempo real para detectar ataques de Inyección SQL y Cross-Site Scripting (XSS).
3. **Resiliencia (Error Handling):** Sistema de tratamiento de errores centralizado para evitar la fuga de información sensible.
4. **Arquitectura:** Basada en Java Web (JSP), Servidores MariaDB/MySQL y despliegue en entorno local mediante XAMPP.

---

## 🛠️ Stack de Tecnologías
* **Frontend:** HTML5, CSS3.
* **Backend:** Java Server Pages (JSP).
* **Base de Datos:** MariaDB (XAMPP).
* **Seguridad:** Regex-based WAF Logic.
* **IDE:** NetBeans 21+.

---

## 🛡️ Características de Seguridad Implementadas

### 1. Web Application Firewall (WAF)
El archivo `filtro_wap.jsp` analiza cada parámetro de entrada buscando patrones maliciosos:
* **SQL Injection:** Bloquea palabras clave como `UNION SELECT`, `OR 1=1`, `DROP TABLE`.
* **XSS:** Sanitiza etiquetas `<script>` para prevenir ejecución de código en el cliente.
* **Logging:** Cada intento de intrusión se registra con la IP del atacante y el payload malicioso.

### 2. Tratamiento de Errores
Se implementó `error_handler.jsp` para capturar excepciones de servidor, asegurando que el usuario final nunca vea detalles técnicos del código.

---

## 📋 Requisitos e Instalación

1. **Base de Datos:**
   * Importar el archivo SQL proporcionado o ejecutar los scripts en `localhost/phpmyadmin`.
   * Nombre de la BD: `bd_pre_examen`.
2. **Configuración en NetBeans:**
   * Agregar el conector `mysql-connector-java.jar` a la carpeta de **Libraries**.
3. **Acceso:**
   * URL principal: `http://localhost:8080/PREexa_2o-Lozada_94APTI/index.jsp`
   * URL pública: https://github.com/alozada-lang/PREexa_2o-Lozada_94APTI.git


---

> **Nota:** Este proyecto forma parte del proceso de evaluación práctica para la materia de Administración de Seguridad Informática.
