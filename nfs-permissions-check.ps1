#set the path you are checking and store as a v

$pathname = Read-Host -Prompt 'Enter your path'

 

#Define path to shared folder

$path = "$pathname

 

#Define path to export the report

$myuser = $env:UserName

$enddate = (Get-Date).tostring("ddMMyyyy")

$filename = "C:\Users\$myuser\Desktop\$enddate" + "_PermissionReport.csv"

$reportpath = $filename

 

#Scan for directories under shared folder and get acl permissions

dir -Recurse $path | where { $_.PsIsContainer } | % { $path1 = $_.fullname; Get-Acl $_.Fullname | % { $_.access | Add-Member -MemberType NoteProperty '.\Application Data' -Value $path1 -passthru }} | Export-Csv $reportpath 
