@echo off
title Servidor Radio Hi-Fi
color 0A

echo ===================================================
echo Iniciando o servidor local para a Radio Hi-Fi...
echo ===================================================
echo.
echo O seu navegador deve abrir automaticamente...
echo Caso nao abra, acesse manualmente: http://localhost:8080
echo.

:: Abre o navegador padrao no localhost:8080
start http://localhost:8080

:: Inicia o servidor Python na porta 8080
python -m http.server 8080

if %errorlevel% neq 0 (
    color 0C
    echo.
    echo [ERRO] Nao foi possivel iniciar o servidor. 
    echo O Python provavelmente nao esta instalado no seu computador.
    echo.
    echo Para o servidor funcionar localmente, voce precisa do Python:
    echo Baixe em: https://www.python.org/downloads/
    echo.
    pause
)
