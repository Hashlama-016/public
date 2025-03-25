Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.17.3-windows-x86_64.zip -OutFile elastic-agent-8.17.3-windows-x86_64.zip 
Expand-Archive .\elastic-agent-8.17.3-windows-x86_64.zip -DestinationPath .
Start-Process cmd.exe -ArgumentList "/k cd C:\Users\god\elastic-agent-8.17.3-windows-x86_64 && echo y | .\elastic-agent.exe install --url=https://10.50.17.5:8220 --enrollment-token=LWdzVXpKVUJmZWQ2MXlqT3NmZEI6djZfSTVxdkdTdEN0TUtDbVZvVGJCZw== --insecure" -Verb RunAs 
./sysmon.ps1
