Import-Module ActiveDirectory

$users = Import-Csv ".\users.csv"

foreach ($user in $users) {

    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    New-ADUser `
        -Name "$($user.FirstName) $($user.LastName)" `
        -SamAccountName $user.UserName `
        -UserPrincipalName "$($user.UserName)@diarabaka.com" `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Enabled $true `
        -AccountPassword $password `
        -ChangePasswordAtLogon $true
}

Write-Host "Users created successfully."