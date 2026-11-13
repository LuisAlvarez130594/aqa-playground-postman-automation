@echo off
chcp 65001 >nul

REM Ir a la carpeta principal del proyecto
cd /d "%~dp0\.."

echo ==========================================
echo AQA Playground - Authentication API Tests
echo ==========================================
echo.

call newman run "collections\AQA Playground – Authentication API.postman_collection.json" ^
-e "environments\AQA Playground - Local.postman_environment.json" ^
-n 5 ^
-r cli,htmlextra ^
--reporter-htmlextra-skipSensitiveData ^
--reporter-htmlextra-export "reports\AQA_Playground_Authentication_Report.html"

if errorlevel 1 (
    echo.
    echo [ERROR] La ejecucion termino con fallos.
    pause
    exit /b 1
)

echo.
echo [OK] Ejecucion completada sin fallos.
echo [OK] Abriendo reporte HTML...

start "" "reports\AQA_Playground_Authentication_Report.html"

pause