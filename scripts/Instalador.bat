@echo off

:: Configurações
set "downloadURL=https://dl.google.com/chrome/install/375.126/chrome_installer.exe"
set "installerPath=%TEMP%\chrome_installer.exe"

:: Baixar o instalador
echo Baixando o instalador do Google Chrome...
powershell -Command "Invoke-WebRequest -Uri %downloadURL% -OutFile %installerPath%"

if %ERRORLEVEL% NEQ 0 (
    echo Erro ao baixar o instalador.
    exit /b %ERRORLEVEL%
)

:: Executar o instalador silenciosamente
echo Instalando o Google Chrome...
%installerPath% /silent /install

if %ERRORLEVEL% NEQ 0 (
    echo Erro durante a instalação.
    exit /b %ERRORLEVEL%
)

:: Limpar o instalador baixado
del %installerPath%

echo Instalacao concluida com sucesso!
pause
