# Lista de servidores
$servers = @("Server1", "Server2", "Server3")

# Caminho para o script de instalação
$scriptPath = "C:\Caminho\Para\Install-ZabbixAgent.ps1"

foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -FilePath $scriptPath
}
