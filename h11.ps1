Set-StrictMode -Version latest

<#Count all the .exe files in the C:\Windows
and its subdirectories (recursive)
#>
Get-ChildItem -Path C:\"Windows"\*.exe -Recurse -Name -Force | Measure-Object

<#List the name of the process using the most 
memory (working set)
#>
Get-Process |Sort-Object WorkingSet -Descending | Select -First 1 -Property ProcessName

<#Using one or more cmdlets, print the day of 
the year for December 31, 2022 (e.g., January 1, 
2022 is day 1)
#>
(Get-Date -Year 2022 -Month 12 -Day 31).DayOfYear

<#List the PowerShell drives sorted by provider 
(ascending)
#>
Get-PSDrive | Sort-Object -Property Provider | Select -Property Provider