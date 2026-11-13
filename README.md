# AQA Playground – Authentication API Automation

Proyecto de automatización de pruebas para los endpoints de autenticación de [AQA Playground](https://github.com/sskorol/aqa-playground), implementado con Postman y ejecutado desde línea de comandos con Newman.

## Objetivo

Validar de forma automatizada los flujos positivos y negativos de autenticación, incluyendo registro, inicio de sesión, renovación de tokens, cierre de sesión y autorización mediante JWT.

## Tecnologías

- Postman Collection Format v2.1
- Newman 6.2.3
- `newman-reporter-htmlextra`
- JavaScript para scripts Pre-request y Post-response
- JWT
- Windows Batch

## Cobertura automatizada

La colección contiene 12 requests:

| # | Escenario |
|---:|---|
| 01 | Registro de usuario válido |
| 02 | Inicio de sesión válido |
| 03 | Inicio de sesión con contraseña inválida |
| 04 | Inicio de sesión con usuario desconocido |
| 05 | Renovación válida del token |
| 06 | Renovación con token inválido |
| 07 | Cierre de sesión válido |
| 08 | Intento de renovación después del cierre de sesión |
| 09 | Consulta del usuario actual sin token |
| 10 | Consulta del usuario actual con token válido |
| 11 | Consulta del usuario actual con token inválido |
| 12 | Consulta del usuario actual con token expirado |

Las validaciones comprueban, entre otros aspectos:

- Código de estado HTTP esperado.
- Formato JSON de la respuesta.
- Tiempo de respuesta menor a 2 segundos.
- Presencia y estructura de tokens JWT.
- Rotación de access token y refresh token.
- Rechazo de tokens inválidos, revocados o expirados.
- Ausencia de credenciales y datos sensibles en respuestas de error.

## Estructura del proyecto

```text
AQA Playground - Postman/
├── collections/
│   └── AQA Playground – Authentication API.postman_collection.json
├── environments/
│   └── AQA Playground - Local.postman_environment.json
├── reports/
│   └── AQA_Playground_Authentication_Report.html
├── scripts/
│   └── run_auth_tests.bat
└── README.md
```

## Requisitos

1. Tener Node.js y npm instalados.
2. Instalar Newman y el reporter HTML:

```bash
npm install -g newman newman-reporter-htmlextra
```

3. Tener el backend de AQA Playground disponible en:

```text
http://localhost:9090
```

## Ejecución rápida en Windows

Con el backend iniciado, ejecutar mediante doble clic:

```text
scripts\run_auth_tests.bat
```

También puede ejecutarse desde CMD, ubicado en la raíz del proyecto:

```cmd
scripts\run_auth_tests.bat
```

El script ejecuta cinco iteraciones y abre automáticamente el reporte HTML generado.

## Ejecución manual con Newman

```cmd
newman run "collections\AQA Playground – Authentication API.postman_collection.json" -e "environments\AQA Playground - Local.postman_environment.json" -n 5 -r cli,htmlextra --reporter-htmlextra-skipSensitiveData --reporter-htmlextra-export "reports\AQA_Playground_Authentication_Report.html"
```

> La colección debe ejecutarse completa y respetando su orden, porque algunos requests utilizan variables generadas por pasos anteriores.

## Resultado de referencia

| Métrica | Resultado |
|---|---:|
| Iteraciones | 5 |
| Requests ejecutados | 60 |
| Assertions ejecutadas | 430 |
| Pruebas fallidas | 0 |
| Pruebas omitidas | 0 |
| Tiempo promedio de respuesta | 30 ms |
| Duración total | 7.3 s |

El reporte de evidencia está disponible en:

```text
reports/AQA_Playground_Authentication_Report.html
```

## Manejo seguro de variables

- Los access tokens y refresh tokens se generan durante la ejecución.
- Los tokens dinámicos se guardan temporalmente como variables de entorno.
- El token utilizado para el escenario expirado es un JWT de prueba vencido y sin valor operativo.
- No se almacenan credenciales reales ni tokens de producción en el repositorio.
- El reporte se genera con `--reporter-htmlextra-skipSensitiveData` para omitir headers y cuerpos sensibles.

## Autor

**Juan Luis Álvarez Leonardo**  
QA Automation Engineer
