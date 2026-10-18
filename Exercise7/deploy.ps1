# PowerShell deployment script for Exercise 7: Jenkins CI Automation
Write-Host "=== Exercise 7: Jenkins CI Server Deployment & Configuration ===" -ForegroundColor Cyan

# 1. Run Jenkins Container
Write-Host "`n[Step 1] Starting Jenkins LTS container on ports 8080 & 50000..." -ForegroundColor Yellow
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

# 2. Verify Container Status
Write-Host "`n[Step 2] Verifying running container..." -ForegroundColor Yellow
docker ps -f "name=jenkins"

# 3. Wait for Jenkins to initialize and generate initialAdminPassword
Write-Host "`n[Step 3] Waiting for Jenkins initialization..." -ForegroundColor Yellow
$maxRetries = 20
$retries = 0
$password = ""

while ($retries -lt $maxRetries) {
    Start-Sleep -Seconds 3
    $retries++
    $password = docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>$null
    if ($password -and $password.Length -eq 32) {
        break
    }
    Write-Host "Waiting for unlock secret ($retries/$maxRetries)..." -ForegroundColor DarkGray
}

Write-Host "`n=== Jenkins Initial Admin Password ===" -ForegroundColor Green
Write-Host "$password" -ForegroundColor Cyan

# 4. Check Web Endpoint
Write-Host "`n[Step 4] Querying Jenkins Web Interface on http://localhost:8080..." -ForegroundColor Yellow
$response = curl.exe -s -I http://localhost:8080/login
Write-Host "$response" -ForegroundColor Green

Write-Host "`n=== Exercise 7 Completed Successfully ===" -ForegroundColor Cyan