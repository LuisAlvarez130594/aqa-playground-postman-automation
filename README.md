# AQA Playground – Authentication API Automation

[!\[AQA Playground - Postman API Tests](https://github.com/LuisAlvarez130594/aqa-playground-postman-automation/actions/workflows/newman-ci.yml/badge.svg)](https://github.com/LuisAlvarez130594/aqa-playground-postman-automation/actions/workflows/newman-ci.yml)



\[📊 Ver reporte HTML público](https://luisalvarez130594.github.io/aqa-playground-postman-automation/reports/AQA\_Playground\_Authentication\_Report.html)



Proyecto de automatización de pruebas para los endpoints de autenticación de [AQA Playground](https://github.com/LuisAlvarez130594/aqa-playground), implementado con Postman, ejecutado con Newman e integrado con GitHub Actions.

## Objetivo

Validar automáticamente los flujos positivos y negativos de autenticación, incluyendo:

* Registro de usuarios.
* Inicio de sesión.
* Renovación de tokens.
* Cierre de sesión.
* Consulta del usuario autenticado.
* Validación de acceso mediante JWT.
* Escenarios con usuarios desconocidos, tokens cerrados y tokens expirados.

## Tecnologías

|Tecnología|Uso dentro del proyecto|
|-|-|
|Postman|Diseño de requests, variables y pruebas de API|
|JavaScript|Validaciones y manejo dinámico de datos y tokens|
|Newman|Ejecución de la colección desde línea de comandos|
|htmlextra|Generación del reporte HTML|
|Docker Compose|Creación temporal del ambiente AQA Playground|
|GitHub Actions|Ejecución automática de las pruebas en la nube|

## Estrategia de pruebas

La colección ejecuta un flujo completo de autenticación. Las validaciones principales comprueban:

* Código de estado HTTP esperado.
* Estructura y contenido de la respuesta.
* Creación y reutilización dinámica de datos de prueba.
* Obtención, renovación y uso de tokens JWT.
* Rechazo de credenciales o tokens no válidos.
* Comportamiento del API después del cierre de sesión.

Las variables de ejecución se administran mediante un Environment de Postman. No se requieren credenciales reales para la ejecución en GitHub Actions.

## Estructura del proyecto

```text
.
├── .github/
│   └── workflows/
│       └── newman-ci.yml
├── collections/
│   └── AQA Playground - Authentication API.postman\_collection.json
├── environments/
│   └── AQA Playground - Local.postman\_environment.json
├── reports/
│   └── AQA\_Playground\_Authentication\_Report.html
├── scripts/
│   └── run\_auth\_tests.bat
├── .gitignore
└── README.md
```

## Integración automática con GitHub Actions

El workflow crea un ambiente limpio y ejecuta el siguiente proceso:

1. Descarga este repositorio de pruebas.
2. Descarga la aplicación AQA Playground.
3. Crea una configuración temporal de prueba.
4. Inicia la aplicación y PostgreSQL con Docker Compose.
5. Espera hasta que el API esté disponible.
6. Instala Newman y el generador del reporte.
7. Ejecuta la colección completa.
8. Publica el reporte HTML como artifact.
9. Detiene y elimina el ambiente temporal.

El workflow se ejecuta automáticamente cuando se modifican la colección, el environment o su propia configuración en la rama `main`. También se ejecuta en Pull Requests y permite ejecución manual.

### Consultar las ejecuciones

El historial, los pasos y los resultados pueden consultarse en [GitHub Actions](https://github.com/LuisAlvarez130594/aqa-playground-postman-automation/actions).

* El propietario o un colaborador con permiso de escritura puede usar **Run workflow**.
* Cualquier visitante puede revisar las ejecuciones y sus resultados.
* Para realizar una ejecución independiente, un visitante puede hacer un **Fork**, habilitar GitHub Actions y ejecutar el workflow en su propia copia.

## Reportes

Cada ejecución automática genera el artifact `newman-html-report`, disponible desde el resumen de GitHub Actions durante 14 días.

También se incluye un [reporte HTML de referencia](reports/AQA_Playground_Authentication_Report.html) generado desde Newman.

## Ejecución local en Windows

### Requisitos

* Docker Desktop.
* Node.js 20 o posterior.
* AQA Playground disponible en `http://localhost:9090`.

Instalar Newman y el reporter:

```cmd
npm install --global newman@6 newman-reporter-htmlextra@1
```

Desde la raíz del repositorio, ejecutar:

```cmd
scripts\\run\_auth\_tests.bat
```

El reporte actualizado se guardará dentro de la carpeta `reports`.

## Seguridad

* El workflow utiliza únicamente credenciales temporales de prueba.
* El ambiente se elimina al finalizar cada ejecución.
* No deben subirse contraseñas, tokens activos ni archivos `.env` con información real.

## Aplicación bajo prueba

Este proyecto utiliza un fork de [AQA Playground](https://github.com/sskorol/aqa-playground), un entorno creado para practicar automatización de pruebas en escenarios cercanos a un proyecto real.

## Autor

**Luis Alvarez**  
QA Automation Engineer  
[GitHub](https://github.com/LuisAlvarez130594)

