# Importa o módulo Active Directory
Import-Module ActiveDirectory

# Configurações iniciais
$domain = "example.com"
$ou = "OU=Users,DC=example,DC=com"
$group = "Employees"

# Entrada de dados do usuário
$firstName = Read-Host "Digite o primeiro nome do usuário"
$lastName = Read-Host "Digite o sobrenome do usuário"
$userName = Read-Host "Digite o nome de usuário"
$password = Read-Host "Digite a senha" -AsSecureString

# Criação da conta do usuário
$newUser = @{
    GivenName = $firstName
    Surname = $lastName
    SamAccountName = $userName
    UserPrincipalName = "$userName@$domain"
    Path = $ou
    AccountPassword = $password
    Enabled = $true
}

try {
    New-ADUser @newUser
    Write-Output "Conta de usuário $userName criada com sucesso."
    
    # Adição ao grupo
    try {
        Add-ADGroupMember -Identity $group -Members $userName
        Write-Output "Usuário $userName adicionado ao grupo $group com sucesso."
    } catch {
        Write-Output "Erro ao adicionar o usuário $userName ao grupo $group: $_"
    }
} catch {
    Write-Output "Erro ao criar a conta de usuário: $_"
}
