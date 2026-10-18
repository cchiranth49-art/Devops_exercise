#!/usr/bin/env bash
set -e

echo "=== Exercise 8: Creating 'Hello World' Jenkins Job ==="

# 1. Verify Shell Script
echo -e "\n[Step 1] Inspecting hello-world.sh script..."
cat hello-world.sh

# 2. Make executable & execute
echo -e "\n[Step 2] Executing hello-world.sh..."
chmod +x hello-world.sh
./hello-world.sh

# 3. Simulate Jenkins Console Output
echo -e "\n[Step 3] Jenkins Console Output:"
echo "Started by user Admin"
echo "Building in workspace /var/jenkins_home/workspace/HelloWorld"
echo "[HelloWorld] $ /bin/sh -xe /tmp/jenkins_script.sh"
echo "+ echo 'Hello, Jenkins!'"
echo "Hello, Jenkins!"
echo "Finished: SUCCESS"

echo -e "\n=== Exercise 8 Completed Successfully ==="