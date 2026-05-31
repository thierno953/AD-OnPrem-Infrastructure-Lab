param(
    [string]$UserName,
    [string]$NewPassword
)

Import-Module ActiveDirectory

$SecurePassword = ConvertTo-SecureString `
    $NewPassword `
    -AsPlainText `
    -Force

Set-ADAccountPassword `
    -Identity $UserName `
    -Reset `
    -NewPassword $SecurePassword

Unlock-ADAccount -Identity $UserName

Write-Host "Password reset completed."