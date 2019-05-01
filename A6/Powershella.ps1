Import-Module ActiveDirectory
$CSV = $args[0]
if (! $CSV) {
Write-Host "Please format this command as 'AddUsersToGroup <csv file>'"
Write-Host "CSV file must have the headers 'UserName' and 'GroupName' with AD usernames and groupnames following"
exit
}
$csvlist = Import-Csv "$CSV"
foreach ($user in $csvlist) {
    $UserName = $user.Username
    $FirstName = $user.FirstName
    $LastName = $user.LastName
    $Description = $user.Description
    $OuPath = $user.OUPath
    $Action= $user.Action
     
     if ($Action -match "Add")
        {New-ADUser -name $UserName -GivenName $FirstName -Surname $LastName -Description $Description -Path $OuPath}

        elseif ($Action -match "Remove")
            {Remove-ADUser -Identity $UserName}
            }
