@echo off

:: Configurações do Robocopy
set "source=\\servidor_origem\pasta"
set "destination=\\servidor_destino\pasta"
set "logfile=C:\caminho\para\log\robocopy.log"

:: Parâmetros do Robocopy
set "options=/MIR /R:5 /W:10 /LOG:%logfile% /NP /TEE"

echo Iniciando a cópia de arquivos...
robocopy %source% %destination% %options%

if %ERRORLEVEL% GEQ 8 (
    echo Erro durante a cópia. Verifique o arquivo de log para mais detalhes.
    exit /b %ERRORLEVEL%
) else (
    echo Cópia concluída com sucesso.
)

pause
