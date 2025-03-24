$client = New-Object System.Net.WebClient
$client.DownloadFile("https://github.com/Hashlama-016/public/raw/refs/heads/main/Sysmon64.exe", "Sysmon64.exe")
$client.DownloadFile("https://github.com/Hashlama-016/public/raw/refs/heads/main/config.xml", "config.xml")
./Sysmon64.exe -accepteula -i ./config.xml
