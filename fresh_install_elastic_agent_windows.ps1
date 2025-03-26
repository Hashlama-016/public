# CONFIG
$version = "8.17.3"
$token = "LWdzVXpKVUJmZWQ2MXlqT3NmZEI6djZfSTVxdkdTdEN0TUtDbVZvVGJCZw=="
$fleetUrl = "https://10.50.17.5:8220"
$agentZip = "elastic-agent-$version-windows-x86_64.zip"
$agentUrl = "https://artifacts.elastic.co/downloads/beats/elastic-agent/$agentZip"
$agentDir = "elastic-agent-$version-windows-x86_64"
$installDir = "C:\Program Files\Elastic\Agent"

# 1. Uninstall existing agent if present
if (Test-Path "$installDir") {
    Start-Process "$installDir\elastic-agent.exe" -ArgumentList "uninstall --force" -Wait -Verb RunAs
    Start-Sleep -Seconds 3
    Remove-Item -Recurse -Force "$installDir"
}

# 2. Download the agent
Invoke-WebRequest -Uri $agentUrl -OutFile $agentZip

# 3. Unzip it
Expand-Archive -Path $agentZip -DestinationPath .

# 4. Run the fresh install (with elevation)
Start-Process "$PWD\$agentDir\elastic-agent.exe" `
    -ArgumentList "install --url=$fleetUrl --enrollment-token=$token --insecure --force" `
    -Verb RunAs -Wait
