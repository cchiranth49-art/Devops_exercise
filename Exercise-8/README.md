# Exercise 8: Jenkins Hello World Job

## Aim
To create and configure a Jenkins Freestyle project that retrieves a shell script from a GitHub repository and executes it as a build step.

## Tools and Technologies Used
- **Jenkins** – Automation server for executing build jobs.
- **Docker** – Used to run Jenkins in a container.
- **Git and GitHub** – Used for version control and source code hosting.
- **Windows PowerShell / VS Code Terminal** – Used to execute Git and Docker commands.
- **Bash Shell Script** – Used to print the Hello World message.

## Procedure

### Step 1: Create a GitHub Repository
Created a public GitHub repository named `devops-sample-code` to store the shell script.


### Step 2: Create the Shell Script
Created a file named `hello-world.sh` with the following content:

```bash
#!/bin/bash
echo "Hello, Jenkins!"
```

### Step 3: Push the Script to GitHub
Initialized the local Git repository, added the shell script, committed the changes, and pushed them to GitHub.

```powershell
git init
git branch -M main
git add hello-world.sh
git commit -m "Add hello-world.sh"
git remote add origin https://github.com/PrajwinRodrigues/devops-sample-code.git
git push -u origin main
```

### Step 4: Start Jenkins Using Docker
Started the existing Jenkins container using:

```powershell
docker start jenkins
```

Verified that the container was running:

```powershell
docker ps
```

### Step 5: Access Jenkins
Opened the Jenkins dashboard in a web browser at:

`http://localhost:8080`

### Step 6: Create a Freestyle Project
Created a new Jenkins job named `HelloWorld` by selecting **New Item**, entering the project name, choosing **Freestyle project**, and clicking **OK**.

### Step 7: Configure Source Code Management
Configured the job to retrieve the script from GitHub.

- **Source Code Management:** Git
- **Repository URL:** `https://github.com/PrajwinRodrigues/devops-sample-code.git`
- **Branch Specifier:** `*/main`
- **Credentials:** Not required for the public repository.

### Step 8: Configure the Build Step
Added an **Execute shell** build step with the following command:

```bash
sh hello-world.sh
```

Saved the job configuration.

### Step 9: Execute and Verify the Job
Opened the `HelloWorld` project and clicked **Build Now**.

Viewed the build's **Console Output** and verified that the script executed successfully.

Expected console output:

```text
Hello, Jenkins!
Finished: SUCCESS
```

## Result
Successfully created and executed a Jenkins Freestyle project that retrieved a shell script from GitHub and printed `Hello, Jenkins!` in the build console.

## Conclusion
This exercise demonstrated how to integrate Jenkins with GitHub, configure source code management, execute a shell script through a Freestyle project, and verify the result using the Jenkins Console Output. It provided a practical introduction to the Continuous Integration workflow.

## References
- [Jenkins Official Website](https://www.jenkins.io/)
- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [Jenkins Docker Image](https://hub.docker.com/r/jenkins/jenkins)
- [DevOps Lab – Exercise 8: Jenkins Hello World Job](https://github.com/SunagP/DevOps-Lab/blob/main/Exercises/8-Jenkins-Hello-World-Job.md)
