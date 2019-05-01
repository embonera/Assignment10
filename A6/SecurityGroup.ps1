Import-Module ActiveDirectory
$CSV = Import-csv -Path "C:\Users\Espoir\Documents\New folder\Security Groups.csv"
ForEach ($item In $CSV)
{
    New-ADGroup -Name $item.Name -Description $item.Description -GroupCategory $item.Category -GroupScope $item.Scope 
}
