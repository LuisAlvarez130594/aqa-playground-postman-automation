@echo off
chcp 65001 >nul

REM Ir a la carpeta principal del proyecto
cd /d "%~dp0\.."

REM Reporte local temporal, fuera del repositorio
set "REPORT_FILE=%TEMP%\AQA_Playground_API_Automation_Report.html"

echo ==========================================
echo AQA Playground - API Automation Tests
echo ==========================================
echo.

call newman run "collections\AQA Playground – API Automation.postman_collection.json" ^
-e "environments\AQA Playground - Local.postman_environment.json" ^
-n 5 ^
-r cli,htmlextra ^
--reporter-htmlextra-skipSensitiveData ^
--reporter-htmlextra-export "%REPORT_FILE%"

if errorlevel 1 (
    echo.
    echo [ERROR] La ejecucion termino con fallos.
    pause
    exit /b 1
)

echo.
echo [OK] Ejecucion completada sin fallos.
echo [OK] Abriendo reporte HTML temporal...

start "" "%REPORT_FILE%"

pause