#
#csv format needs to be as follows:
#Alias,Firstname, Lastname,Name,UPN,OUpath,MBDB,password 
Andover IT at 8/16/2019 1:20 PM
#change the name and path of the csv file as required


$users = Import-CSV "c:\scripts\boardtest.csv"; 
$users| foreach {New-Mailbox -Alias $_.alias -name $_.Name -UserPrincipalName $_.upn -OrganizationalUnit $_.OU -Password ($_.password | Convertto-Securestring -asplaintext -force)}
$users| foreach {set-aduser -identity $_.alias -description $_.desc}
$users| foreach {set-aduser -identity $_.alias -department $_.dept}



name,alias,firstname,lastname,upn,ou,resetpass,password,dept,desc
