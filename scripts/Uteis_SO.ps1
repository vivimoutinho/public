Get-CimInstance -ClassName Win32_BIOS

----

Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty "CIM*"

----

Get-CimInstance -ClassName Win32_QuickFixEngineering

----

Get-CimInstance -ClassName Win32_QuickFixEngineering -Property HotFixID

----

Get-CimInstance -ClassName Win32_OperatingSystem |
    Select-Object -Property Build*,OSType,ServicePack*

----

Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property *user*

----

Get-CimInstance -ClassName Win32_LogonSession

----

Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName

----

Get-CimInstance -ClassName Win32_Service |
    Format-Table -Property Status, Name, DisplayName -AutoSize -Wrap