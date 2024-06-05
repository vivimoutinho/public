@echo off

:: Configurações do Robocopy
set "source=\\servidor\caminho\para\arquivos"
set "destination=C:\caminho\local\de\destino"
set "logfile=C:\caminho\local\para\log\robocopy_server_to_local.log"

:: Parâmetros do Robocopy
set "options=/MIR /R:5 /W:10 /LOG:%logfile% /NP /TEE"

echo Iniciando a cópia de arquivos do servidor para a máquina local...
robocopy %source% %destination% %options%

if %ERRORLEVEL% GEQ 8 (
    echo Erro durante a cópia. Verifique o arquivo de log para mais detalhes.
    exit /b %ERRORLEVEL%
) else (
    echo Cópia concluída com sucesso.
)

pause
