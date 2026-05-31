Import-Module ActiveDirectory

Get-ADUser -Filter 'Enabled -eq $false' `
    -Properties Name |
    Select-Object Name, SamAccountName |
    Export-Csv ".\disabled-users.csv" -NoTypeInformation

Write-Host "Disabled users exported."