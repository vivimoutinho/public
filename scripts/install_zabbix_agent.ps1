# Define a URL de download do Zabbix Agent
$zabbixAgentUrl = "https://cdn.zabbix.com/zabbix/binaries/stable/5.4/5.4.10/zabbix_agent-5.4.10-windows-amd64-openssl.msi"

# Define o caminho de download
$localPath = "$env:TEMP\zabbix_agent.msi"

# Baixa o Zabbix Agent
Invoke-WebRequest -Uri $zabbixAgentUrl -OutFile $localPath

# Instala o Zabbix Agent
Start-Process msiexec.exe -ArgumentList "/i $localPath /quiet" -Wait

# Configura o Zabbix Agent
$zabbixServer = "zabbix.example.com" # Altere para o endereço do seu servidor Zabbix
$configFile = "C:\Program Files\Zabbix Agent\zabbix_agentd.conf"

# Define configurações no arquivo de configuração
(Get-Content $configFile) -replace "# Server=127.0.0.1", "Server=$zabbixServer" | Set-Content $configFile
(Get-Content $configFile) -replace "# ServerActive=127.0.0.1", "ServerActive=$zabbixServer" | Set-Content $configFile
(Get-Content $configFile) -replace "# Hostname=Windows host", "Hostname=$env:COMPUTERNAME" | Set-Content $configFile

# Reinicia o serviço do Zabbix Agent para aplicar as alterações
Restart-Service "Zabbix Agent"
