Import-module ActiveDirectory 
 
$Groups = Import-CSV c:\Modifying.csv 
 
ForEach ($User in $Groups) 
{ 
    $GroupName = $User.GroupName
    $Username = $user.UserName
    $Action= $user.Action

    if ($Action -match "Add")
        {New-ADGroup -name $GroupName -UserName $Username

        elseif ($Action -match "Remove")
            {Remove-ADUser -Identity $Username}
            }
 
Add-ADGroupMember -Identity IT -Member $User.username 
Add-ADGroupMember -Identity Sales -Member $User.username 
Add-ADGroupMember -Identity Managment -Member $User.username
}
