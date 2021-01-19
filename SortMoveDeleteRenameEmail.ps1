<#For execution: powershell.exe -ExecutionPolicy Unrestricted -File C:\MediaFiles\Script\Move_Delete_Email.ps1 "param1" "param2"#>
$FileName = $args[0] <#Parameters passed #>
$Directory = $args[1]
$PC = $env:computername
add-content C:\MediaFiles\Log\log.txt "$FileName `n" <#Create output log#>
Move-Item C:\MediaFiles\Completed\*\* -include *.mkv,*.mp4,*.flv,*.avi,*.m4v C:\MediaFiles\Completed -force <#Move all video format items from subfolders into the root folder#>
Remove-Item C:\MediaFiles\Completed\* -exclude *.mkv,*.mp4,*.flv,*.avi,*.m4v -recurse -force <#Delete all items and subfolders, excluding the video formats#>
filebot -rename -non-strict C:\MediaFiles\Completed\* --log-file MDE.txt <#Calling filebot to rename all files in the directory (opportunistic rename) and log the output#>
Get-ChildItem C:\MediaFiles\Completed\* -recurse | where-object {$_.length -gt 1000000000} | move-item -destination C:\MediaFiles\Movies <#Move all items greater than 1GB into movies folder#>
Get-ChildItem C:\MediaFiles\Completed\* -recurse | where-object {$_.length -lt 1000000000} | move-item -destination C:\MediaFiles\TV_Shows <#Move all items less than 1GB into TV Shows folder#>
move-item C:\MediaFiles\Movies\* "\\192.168.1.66\Multimedia\Media Server\Plex\Pushed\Movies" <#Move movies to NAS Address & Directory#>
move-item C:\MediaFiles\TV_Shows\* "\\192.168.1.66\Multimedia\Media Server\Plex\Pushed\TV Shows" <#Move TV Shows to NAS Address & Directory#>
$EmailFrom = “xxxxx@outlook.com” <#Email sender#>
$EmailTo = “xxxxx@xxxxx.com”<#Email recipient#>
$Subject = “File Sorted” <#Email subject#>
$Body = “PC: $PC `n `n Name: $FileName `n `n Directory: $Directory” <#Email body#>
$SMTPServer = “smtp-mail.outlook.com” <#Outlook server outgoing address#>
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) <#Outlook server outgoing port#>
$SMTPClient.EnableSsl = $true <#SSL Enabled#>
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(“xxxxxxx@outlook.com”, “password”); <#Sender Email Address & Pasword#>
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body) <#Send email#>
