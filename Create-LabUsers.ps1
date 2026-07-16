# Bulk Active Directory user provisioning script

Import-Module ActiveDirectory

$CsvPath = "C:\LabFiles\users.csv"
$DomainFqdn = "LAB.local"
$BaseOU = "OU=Company,DC=LAB,DC=local"

if (-not (Test-Path $CsvPath)) {
    throw "The CSV file was not found at $CsvPath."
}

$InitialPassword = Read-Host `
    "Enter the temporary password for the new users" `
    -AsSecureString

$Users = Import-Csv -Path $CsvPath

foreach ($User in $Users) {
    $DisplayName = "$($User.FirstName) $($User.LastName)"
    $OUPath = "OU=$($User.Department),$BaseOU"
    $GroupName = "GG_$($User.Department)_Users"

    try {
        Get-ADOrganizationalUnit `
            -Identity $OUPath `
            -ErrorAction Stop | Out-Null

        Get-ADGroup `
            -Identity $GroupName `
            -ErrorAction Stop | Out-Null

        $ExistingUser = Get-ADUser `
            -Filter "SamAccountName -eq '$($User.Username)'" `
            -ErrorAction SilentlyContinue

        if ($ExistingUser) {
            Write-Warning "$($User.Username) already exists. Skipping."
            continue
        }

        $NewUser = New-ADUser `
            -Name $DisplayName `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -DisplayName $DisplayName `
            -SamAccountName $User.Username `
            -UserPrincipalName "$($User.Username)@$DomainFqdn" `
            -Department $User.Department `
            -Title $User.Title `
            -Path $OUPath `
            -AccountPassword $InitialPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true `
            -PassThru `
            -ErrorAction Stop

        Add-ADGroupMember `
            -Identity $GroupName `
            -Members $NewUser `
            -ErrorAction Stop

        Write-Host `
            "Created $DisplayName in $OUPath and added the account to $GroupName."
    }
    catch {
        Write-Warning "Failed to create $DisplayName. $($_.Exception.Message)"
    }
}