Rename-Item -Path C:\temp\New.Directory\file1.txt fileOne.txt

----

Move-Item -Path C:\temp\New.Directory -Destination C:\ -PassThru

----

Copy-Item -Path C:\New.Directory -Destination C:\temp

----

Copy-Item -Path C:\New.Directory -Destination C:\temp -Recurse -Force -Passthru

----

Remove-Item C:\temp\New.Directory -Recurse

----

Invoke-Item C:\boot.ini