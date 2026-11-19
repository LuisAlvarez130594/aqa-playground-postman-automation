# AQA Playground – API Automation

[![AQA Playground - Postman API Tests](https://github.com/LuisAlvarez130594/aqa-playground-postman-automation/actions/workflows/newman-ci.yml/badge.svg)](https://github.com/LuisAlvarez130594/aqa-playground-postman-automation/actions/workflows/newman-ci.yml)

[Ver último reporte HTML](https://luisalvarez130594.github.io/aqa-playground-postman-automation/reports/AQA_Playground_Authentication_Report.html)

Proyecto de automatización de pruebas para los módulos de autenticación y productos de [AQA Playground](https://github.com/LuisAlvarez130594/aqa-playground), implementado con Postman, ejecutado con Newman e integrado con GitHub Actions.

## Objetivo

Validar automáticamente los flujos positivos y negativos de la API, incluyendo:

- Registro e inicio de sesión de usuarios.
- Obtención, renovación y revocación de tokens JWT.
- Consulta del usuario autenticado.
- Acceso a endpoints protegidos.
- Creación y consulta de productos.
- Creación masiva de productos mock.
- Eliminación de productos.
- Validación de datos incorrectos.
- Solicitudes sin token, con token inválido o expirado.
- Conflictos por productos duplicados.

## Cobertura actual

La colección contiene **22 requests** distribuidos en dos módulos:

| Módulo | Requests | Escenarios negativos |
|---|---:|---:|
| Authentication | 13 | 7 |
| Products | 9 | 5 |
| **Total** | **22** | **12** |

Una ejecución completa realiza actualmente **105 assertions**.

La ejecución local configurada con cinco iteraciones procesa:

- 110 requests.
- 525 assertions.
- Flujos positivos y negativos.
- Validaciones de autenticación, contratos y reglas de negocio.

## Tecnologías

| Tecnología | Uso dentro del proyecto |
|---|---|
| Postman | Diseño de requests, variables y pruebas de API |
| JavaScript | Validaciones y manejo dinámico de datos y tokens |
| Newman | Ejecución de la colección desde línea de comandos |
| htmlextra | Generación del reporte HTML |
| Docker Compose | Creación temporal del ambiente AQA Playground |
| GitHub Actions | Ejecución automática y publicación del último reporte |
| GitHub Pages | Publicación del reporte HTML más reciente |

## Estrategia de pruebas

Las validaciones principales comprueban:

- Código de estado HTTP esperado.
- Estructura, tipos y contenido de las respuestas.
- Creación y reutilización dinámica de datos de prueba.
- Obtención, renovación y uso de tokens JWT.
- Rechazo de credenciales o tokens no válidos.
- Comportamiento de la API después del cierre de sesión.
- Protección de los endpoints de productos.
- Validaciones de campos obligatorios y tipos de datos.
- Manejo de conflictos por productos duplicados.
- Ausencia de información sensible en respuestas de error.

Las variables de ejecución se administran mediante un Environment de Postman. No se requieren credenciales reales para la ejecución en GitHub Actions.

## Estructura del proyecto

```text
.
├── .github/
│   └── workflows/
│       └── newman-ci.yml
├── collections/
│   └── AQA Playground – API Automation.postman_collection.json
├── environments/
│   └── AQA Playground - Local.postman_environment.json
├── reports/
│   └── AQA_Playground_Authentication_Report.html
├── scripts/
│   └── run_api_tests.bat
├── .gitignore
└── README.md
```

## Integración automática con GitHub Actions

El workflow crea un ambiente limpio y ejecuta el siguiente proceso:

1. Descarga este repositorio de pruebas.
2. Descarga la aplicación AQA Playground.
3. Crea una configuración temporal de prueba.
4. Inicia la aplicación y PostgreSQL con Docker Compose.
5. Espera hasta que la API esté disponible.
6. Instala Newman y el generador del reporte.
7. Ejecuta la colección completa.
8. Genera y publica el reporte HTML como artifact.
9. Publica el último reporte mediante GitHub Pages.
10. Detiene y elimina el ambiente temporal.

El workflow se ejecuta automáticamente cuando se modifican la colección, el environment o su propia configuración en la rama `main`. También se ejecuta en Pull Requests y permite ejecución manual.

### Consultar las ejecuciones

El historial, los pasos y los resultados pueden consultarse en [GitHub Actions](https://github.com/LuisAlvarez130594/aqa-playground-postman-automation/actions).

- El propietario o un colaborador con permiso de escritura puede usar **Run workflow**.
- Cualquier visitante puede revisar las ejecuciones y sus resultados.
- Un visitante puede realizar un **Fork**, habilitar GitHub Actions y ejecutar el workflow en su propia copia.

## Reportes

Cada ejecución automática:

- Genera el artifact `newman-html-report`.
- Conserva el artifact durante 14 días.
- Publica el último resultado mediante GitHub Pages.
- Mantiene disponible el enlace público compartido en el README y LinkedIn.

[Consultar el último reporte publicado](https://luisalvarez130594.github.io/aqa-playground-postman-automation/reports/AQA_Playground_Authentication_Report.html)

## Ejecución local en Windows

### Requisitos

- Docker Desktop.
- Node.js 20 o posterior.
- AQA Playground disponible en `http://localhost:9090`.
- Newman y `newman-reporter-htmlextra`.

Instalar Newman y el reporter:

```cmd
npm install --global newman@6 newman-reporter-htmlextra@1
```

Desde la raíz del repositorio, ejecutar:

```cmd
scripts\run_api_tests.bat
```

El script ejecuta cinco iteraciones, genera un reporte temporal y lo abre automáticamente en el navegador. Este reporte local sirve para revisar los resultados y no reemplaza directamente el reporte publicado en GitHub Pages.

El reporte público se actualiza cuando GitHub Actions ejecuta correctamente el workflow en la rama `main`.

## Seguridad

- El workflow utiliza únicamente credenciales temporales de prueba.
- El ambiente se elimina al finalizar cada ejecución.
- El reporte oculta información sensible.
- No deben subirse contraseñas, tokens activos ni archivos `.env` con información real.

## Aplicación bajo prueba

Este proyecto utiliza un fork de [AQA Playground](https://github.com/sskorol/aqa-playground), un entorno creado para practicar automatización de pruebas en escenarios cercanos a un proyecto real.

## Autor

**Luis Alvarez**  
QA Automation Engineer  
[GitHub](https://github.com/LuisAlvarez130594)
