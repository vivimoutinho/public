@echo off

:: Configurações do Robocopy
set "source=C:\caminho\local\para\arquivos"
set "destination=\\servidor\caminho\de\destino"
set "logfile=C:\caminho\local\para\log\robocopy_local_to_server.log"

:: Parâmetros do Robocopy
set "options=/MIR /R:5 /W:10 /LOG:%logfile% /NP /TEE"

echo Iniciando a cópia de arquivos da máquina local para o servidor...
robocopy %source% %destination% %options%

if %ERRORLEVEL% GEQ 8 (
    echo Erro durante a cópia. Verifique o arquivo de log para mais detalhes.
    exit /b %ERRORLEVEL%
) else (
    echo Cópia concluída com sucesso.
)

pause
