$ExtractPath = "C:\Program Files"

# Download Filebeat
Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.17.3-windows-x86_64.zip -OutFile elastic-agent-8.17.3-windows-x86_64.zip

# Extract Filebeat
Expand-Archive C:\WINDOWS\system32\elastic-agent-8.17.3-windows-x86_64.zip -DestinationPath $ExtractPath -Force
Start-Process cmd.exe -ArgumentList "/k cd C:\Program Files\elastic-agent-8.17.3-windows-x86_64 && echo y | .\elastic-agent.exe install --fleet-server-es=https://10.50.3.4:9200 --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3NDI0Nzc5MDYwMjc6YjJPLXA0TjRTN0dPVUdiQ0d3NUpIZw  --fleet-server-policy=fleet-server-policy --fleet-server-es-ca-trusted-fingerprint=38c47c1a02e9c5c59bdca896191369cf8bcd9abde135a18ca99e7e808b8bf09c --fleet-server-port=8220" -Verb RunAs 