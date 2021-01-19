# SortMoveDeleteRenameEmail
PowerShell script to sort out messy media files. 

FileBot recommended, but not essential. FileBot can be downloaded here: https://www.filebot.net/ and a license for FileBot is required and can be purchased from the FileBot site here (its worth it!): https://www.filebot.net/purchase.html.

Quick script to sort out files on a media server. This script can be passed parameters through an application or executed with PowerShell. 

To execute this script without passing parameters, amend the file locations to your media files, remove lines 1, 2 & 3 and amend the text in line 16, where the body of the text utilizes the parameters. 

To use the script in an application, place the execution command from line 1 'powershell.exe -ExecutionPolicy Unrestricted -File C:\MediaFiles\Script\Move_Delete_Email.ps1 "parameter1" "parameter2"' into a trigger and amend the file location to where you have stored the script. If the application does not allow passing of parameters, then remove "parameter1" & "parameter2" and remove reference of the parameters in lines 2 & 3 from line 16. 

Quick notes:

 - SortMoveDeleteRenameEmail will move all files that have an extension that matches those in the extensions listed in line 6 & 7 and remove files whose extensions do not match. Remove lines 6 & 7 if this functionality is not required.

 - SortMoveDeleteRenameEmail utilizes FileBot for the renaming of media files. Movie and TV files are the intended target, however it is set to be opportunistic and FileBot might rename any recognizable media format including music videos and songs (if the extensions list in line 6 is changed to the relevant extensions), provided that the data is stored in the databases where FileBot draws information. More information here: https://www.filebot.net/forums/viewtopic.php?t=4695. Remove line 8 if this functionality is not required.
 
 - SortMoveDeleteRenameEmail can sort files by size, aligning them in the correct folders if desired. The current threshold for file sizing is 1GB as seen in line 9 where any files found greater than 1GB are sorted into the movie folder and again in line 10, where any files less than 1GB are sorted into a TV show folder. Where 1000000000 bytes = 1GB. Remove lines 9 & 10 if this functionality is not required.

- SortMoveDeleteRenameEmail can push content onto remote storage as required, as seen in lines 11 & 12 where the previously sorted movie and TV show files are sorted into their respective folders remotely. This will require prior access to remote storage on the system executing the script, a network drive map is the easiest way to grant access for the script to push content. Remove lines 11 & 12 if this functionality is not required. 

- SortMoveDeleteRenameEmail can send an email once the script has been run. It is currently only setup to accept Microsoft Outlook accounts in lines 17, 18 & 19. However, this can be changed to the desired email provider's settings. Enter your relevant email credentials in lines 13, 14 & 20. You can update the content of the message in lines 15 & 16, currently this is utilizing the parameters, however you can change this as desired. Remove lines 13 - 21 if this functionality is not required.
