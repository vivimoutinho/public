# Servidores onde a tarefa será habilitada
$serversToEnable = @("Server1", "Server2")

# Servidores onde a tarefa será desabilitada
$serversToDisable = @("Server3", "Server4")

# Nome da tarefa agendada
$taskName = "\MinhaTarefaAgendada"

function Enable-ScheduledTask {
    param (
        [string]$server,
        [string]$taskName
    )
    Invoke-Command -ComputerName $server -ScriptBlock {
        $taskName = $using:taskName
        $task = Get-ScheduledTask -TaskName $taskName
        if ($task) {
            Enable-ScheduledTask -TaskName $taskName
            Write-Output "Tarefa $taskName habilitada em $env:COMPUTERNAME"
        } else {
            Write-Output "Tarefa $taskName não encontrada em $env:COMPUTERNAME"
        }
    }
}

function Disable-ScheduledTask {
    param (
        [string]$server,
        [string]$taskName
    )
    Invoke-Command -ComputerName $server -ScriptBlock {
        $taskName = $using:taskName
        $task = Get-ScheduledTask -TaskName $taskName
        if ($task) {
            Disable-ScheduledTask -TaskName $taskName
            Write-Output "Tarefa $taskName desabilitada em $env:COMPUTERNAME"
        } else {
            Write-Output "Tarefa $taskName não encontrada em $env:COMPUTERNAME"
        }
    }
}

foreach ($server in $serversToEnable) {
    Enable-ScheduledTask -server $server -taskName $taskName
}

foreach ($server in $serversToDisable) {
    Disable-ScheduledTask -server $server -taskName $taskName
}
