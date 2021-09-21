#$InputPath = "D:\Git\PowerShell"
#$String = "*Password*"

Function Get-FileswithString
{

    param (
    $InputPath,
    $String
    )

    $AllLogFiles = Get-ChildItem -Path $InputPath -Filter "*.log"

    Foreach ($OneFile in $AllLogFiles)
    {
    $FileContent = $null
    $FileContent = Get-Content -Path $OneFile.FullName

        If($FileContent -like $String)
        {
            #Write-Host "Found" -ForegroundColor Green
            Write-Host "[     Found ] " -F Green -NoNewline
            Write-Host $OneFile.FullName
        }
        Else
        {
            Write-Host "[ Not Found ] " -F Red -NoNewline
            Write-Host $OneFile.FullName
        }
    }
}

Get-FileswithString -InputPath "D:\Git\PowerShell" -String "*Password*"