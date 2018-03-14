# Preparing the Windows 7 OS VM victim

Take a look [here](https://github.com/hfiref0x/VBoxHardenedLoader) before start.

### Disable the reserved partition

Press Shift+F10 while installing Windows to open a Command Prompt window.

    diskpart <Enter>
    select disk 0 
    create partition primary

### Create a second vSwitch

Cuckoo-mgr should have 2 network interfaces

## Create a "victim" VM named mine cuckoo1

### Enable autologin for 

1. Click Start, type netplwiz, and then press Enter.
2. In the User Accounts dialog box, highlight the account you want to automatically log on to. Uncheck the _Users Must Enter A User Name And Password To Use This Computer_.
3. Click OK. 
4. In the Automatically Log On dialog box, enter the user’s password twice and click OK.

### Disable Windows Defender

1. Start, type Windows Defender and hit enter
2. Tools menu -> Options
  1. Disable “Automatic Scanning"
  2. Disable “Realtime Protection”
  3. Disable Administrator -> Use this program

### Disable notices

Under Action Center -> Change Action Center Settings turn off messages for:
  * Windows Update
  * Spyware and Related Protection
  * Virus Protection
  * Windows Backup
  * Check for Updates

### Configure IE

1. Launch Internet Explorer
2. Choose "Dont use recommended settings"
3. Under Tools -> Internet Options. Set your homepage to held a about:blank, then click apply

To auto-execute downloaded files, you must:

1. Create this key if it doesn't exist:

        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}"

2. Fill with some values:

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v jpegfile /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v pngfile /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v TIFImage.Document /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v jarfile /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v exefile /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v VBSFile /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v JSFile /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v Microsoft.PowerShellScript.1 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v AcroExch.Document.DC /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v Word.Document.12 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v Word.Document.8 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v PowerPoint.Show.12 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v PowerPoint.Show.8 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v Excel.Sheet.12 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v Excel.Sheet.8 /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v 7-Zip.7z /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v 7-Zip.zip /t REG_SZ /d 0

        reg add "HKCU\Software\Microsoft\Windows\Shell\AttachmentExecute\{0002DF01-0000-0000-C000-000000000046}" /f /v 7-Zip.rar /t REG_SZ /d 0

Look under the registry base key HKEY_CLASSES_ROOT for more extensions.
There will be keys there called ".pdf", ".xls", etc.
The default value for the key is the ProgID.

        HKEY_CLASSES_ROOT
        .ext
            (Default) = ProgID.ext.1

OBS.: For 7zip file associations look [here](https://gist.githubusercontent.com/jeremejevs/9102144/raw/30d3c7b39542339210edc42519ac719227fbd43c/associations-7zip.reg)

Also, you may want to add these:

        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d "1808" /f

        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f 

Sources:
  * https://msdn.microsoft.com/pt-br/library/windows/desktop/cc144148(v=vs.85).aspx
  * https://msdn.microsoft.com/en-us/library/windows/desktop/ms724475(v=vs.85).aspx
  * https://support.microsoft.com/pt-br/help/883260/information-about-the-attachment-manager-in-microsoft-windows

### Required Programs

1. Install [Python 2.7](https://www.python.org/downloads/release/python-2714/)
  1. Add to system PATH: C:\Python27
  2. Create new system variables
  
    PYTHONHOME = C:\Python27

    PYTHONPATH = C:\Python27\DLLs;C:\Python27\Lib;C:\Python27\Lib\site-packages

2. Download and install [Pillow](https://pypi.python.org/pypi/Pillow/5.0.0)

### Disable UAC

1. Go to Start Menu -> Control Panel -> User Accounts and Family Safety -> User Accounts.
2. Click on Change User Account Control settings link.
3. Slide the slider bar to the lowest value with description Never notify.
4. Click OK to make the change effective.

### Auto run Cuckoo agent

1. With regedit browse to
  ```
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
  ```
2. Add a new "string value" with any name, fill the value with the file path where the Cuckoo agent was placed (e.g. C:\agent\agent.pyw). It is a good idea to change the agent name for anything else.

### Open remote operations

1. Open cmd console and do:
  ```
  reg add "hklm\system\CurrentControlSet\Control\TerminalServer" /v AllowRemoteRPC /d 0x01 /t REG_DWORD /f
  ```
  ```
  reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v LocalAccountTokenFilterPolicy /d 0x01 /t REG_DWORD /f
  ```

### Set the TCP/IP addresses

1. Set the IPv4 properties of your Host-Only NIC to use the following ip address
    * 192.168.56.101
2. Set the IPv4 properties of your Host-Only NIC to use the default gateway
    * 192.168.56.1
3. Set the IPv4 properties of your Host-Only NIC to use the following dns server addresses
    * 8.8.8.8


Restart the VM.

#### Other guides

* https://www.proteansec.com/linux/installing-using-cuckoo-malware-analysis-sandbox/
* https://infosecspeakeasy.org/t/howto-build-a-cuckoo-sandbox/27
* http://www.rffuste.com/2017/07/11/cuckoo-sandbox-install-guideline-preparing-the-host-12/