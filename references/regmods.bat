@ECHO OFF

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}"

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "jpegfile" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "pngfile" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "TIFImage.Document" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "jarfile" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "exefile" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "VBSFile" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "JSFile" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "Microsoft.PowerShellScript.1" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "AcroExch.Document.DC" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "Word.Document.12" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "Word.Document.8" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "PowerPoint.Show.12" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "PowerPoint.Show.8" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "Excel.Sheet.12" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "Excel.Sheet.8" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "7-Zip.7z" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "7-Zip.zip" /t REG_NONE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v "7-Zip.rar" /t REG_NONE

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d "1808" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f 

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /d "1" /t REG_DWORD /f
reg add "hklm\system\CurrentControlSet\Control\TerminalServer" /v "AllowRemoteRPC" /d "1" /t REG_DWORD /f

rem reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "agent" /t REG_SZ /d "C:\agent.pyw" /f