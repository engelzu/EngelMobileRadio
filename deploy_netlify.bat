@echo off
title Preparar Deploy - EngelMobile Radio
color 0B

echo ========================================================
echo   PREPARANDO PASTA 'OUT' PARA DEPLOY MANUAL NO NETLIFY
echo ========================================================
echo.

:: Deleta a pasta OUT antiga se ela existir para evitar arquivos velhos
if exist OUT (
    echo [*] Limpando pasta OUT antiga...
    rd /s /q OUT
)

:: Cria a nova pasta
echo [*] Criando pasta OUT...
mkdir OUT

:: Copia os arquivos essenciais do projeto para dentro da pasta OUT
echo [*] Copiando arquivos do site...
copy index.html OUT\ >nul
copy manifest.json OUT\ >nul
copy sw.js OUT\ >nul
copy icone.png OUT\ >nul
copy fita.jpg OUT\ >nul
copy fita_alta_resolucao.png OUT\ >nul
copy rolo.png OUT\ >nul
copy globo.png OUT\ >nul
xcopy /s /e /y /i icons OUT\icons\ >nul

echo.
echo ========================================================
echo   TUDO PRONTO!
echo.
echo   1. Abra o painel do seu Netlify no navegador.
echo   2. Pegue a pasta 'OUT' que acabou de ser criada aqui.
echo   3. Arraste e solte ela la na tela do Netlify.
echo ========================================================
pause
