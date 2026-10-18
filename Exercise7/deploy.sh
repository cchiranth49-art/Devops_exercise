#!/usr/bin/env bash
set -e

echo "=== Exercise 7: Jenkins CI Server Deployment & Configuration ==="

# 1. Run Jenkins Container
echo -e "\n[Step 1] Starting Jenkins LTS container on ports 8080 & 50000..."
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

# 2. Verify Container Status
echo -e "\n[Step 2] Verifying running container..."
docker ps -f "name=jenkins"

# 3. Wait for Jenkins to initialize and generate initialAdminPassword
echo -e "\n[Step 3] Waiting for Jenkins initialization..."
max_retries=20
retries=0
password=""

while [ $retries -lt $max_retries ]; do
    sleep 3
    retries=$((retries + 1))
    password=$(docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null || true)
    if [ ${#password} -eq 32 ]; then
        break
    fi
    echo "Waiting for unlock secret ($retries/$max_retries)..."
done

echo -e "\n=== Jenkins Initial Admin Password ==="
echo "$password"

# 4. Check Web Endpoint
echo -e "\n[Step 4] Querying Jenkins Web Interface on http://localhost:8080..."
curl -s -I http://localhost:8080/login | head -n 5

echo -e "\n=== Exercise 7 Completed Successfully ==="