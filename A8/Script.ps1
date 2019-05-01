Get-ADComputer -Filter * -properties * | select Name,Enabled, Created, Modified, DistinguishName | Export-Csv ExportFile8.csv
