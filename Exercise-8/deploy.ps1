# PowerShell execution script for Exercise 8: Jenkins Hello World Job
Write-Host "=== Exercise 8: Creating 'Hello World' Jenkins Job ===" -ForegroundColor Cyan

# 1. Verify Shell Script
Write-Host "`n[Step 1] Inspecting hello-world.sh script..." -ForegroundColor Yellow
Get-Content hello-world.sh

# 2. Execute Shell Script locally
Write-Host "`n[Step 2] Executing hello-world.sh directly..." -ForegroundColor Yellow
bash hello-world.sh

# 3. Simulate / Demonstrate Jenkins Job Execution
Write-Host "`n[Step 3] Simulating Jenkins Freestyle Job (HelloWorld) Execution..." -ForegroundColor Yellow
Write-Host "Started by user Admin" -ForegroundColor DarkGray
Write-Host "Building in workspace /var/jenkins_home/workspace/HelloWorld" -ForegroundColor DarkGray
Write-Host "[HelloWorld] $ /bin/sh -xe /tmp/jenkins_script.sh" -ForegroundColor Cyan
Write-Host "+ echo 'Hello, Jenkins!'" -ForegroundColor Yellow
Write-Host "Hello, Jenkins!" -ForegroundColor Green
Write-Host "Finished: SUCCESS" -ForegroundColor Green

Write-Host "`n=== Exercise 8 Completed Successfully ===" -ForegroundColor Cyan