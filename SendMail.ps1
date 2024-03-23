$computerName = [System.Net.Dns]::GetHostName()
$body = "Message sent from $computerName"
Send-MailMessage -SmtpServer 'smtp.cse.lehigh.edu.' -From gak425@lehigh.edu -To ilc224@lehigh.edu,masa20@lehigh.edu -Cc mae5@lehigh.edu -Bcc joykim10203@gmail.com -Subject 'CSE 271 -  Hello from PowerShell on Sunlab' -Body $body

