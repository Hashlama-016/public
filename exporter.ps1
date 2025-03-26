$client = New-Object System.Net.WebClient
$client.DownloadFile("https://github.com/prometheus-community/windows_exporter/releases/download/v0.30.5/windows_exporter-0.30.5-amd64.msi", "windows_exporter.msi")
msiexec /i windows_exporter.msi /q --% LISTEN_PORT=9100
netsh advfirewall firewall add rule name="Expose Exporter" dir=in action=allow protocol=TCP localport=9100
