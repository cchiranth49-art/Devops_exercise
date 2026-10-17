# Exercise 7: Introduction to Continuous Integration (CI) and Jenkins Installation

## 1. Introduction to Continuous Integration (CI)

Continuous Integration (CI) is a software development practice in which developers frequently integrate code changes into a shared repository. The main goal is to detect errors early, improve software quality, and accelerate software delivery.

### Key Features of CI

1. **Frequent Code Integration:** Developers commit code changes to a shared repository regularly.
2. **Automated Builds:** Each code change can trigger an automated build.
3. **Automated Testing:** Tests run to verify that changes do not break existing functionality.
4. **Immediate Feedback:** Developers receive feedback about build and test results.

### Benefits of CI

- **Early Bug Detection:** Identifies integration problems early.
- **Improved Collaboration:** Helps developers integrate their changes smoothly.
- **Faster Development Cycles:** Automates repetitive build and testing tasks.
- **High-Quality Code:** Helps prevent regressions through automated testing.

### How CI Works

1. A developer writes and commits code.
2. The code is pushed to a version control repository.
3. A CI server detects the change and starts a build.
4. Automated tests validate the code.
5. The CI server reports success or failure.

### Examples of CI/CD Tools

| Tool | Description |
|---|---|
| Jenkins | Open-source automation server with an extensive plugin ecosystem |
| GitLab CI/CD | CI/CD pipelines integrated with GitLab |
| CircleCI | CI/CD platform supporting automated builds and tests |
| Travis CI | CI service integrated with source-code repositories |
| Bamboo | Atlassian CI/CD server |
| TeamCity | CI/CD server developed by JetBrains |
| GitHub Actions | Workflow automation integrated with GitHub |
| Azure Pipelines | CI/CD service in Azure DevOps |
| Buildkite | Pipeline platform using hosted management and build agents |
| Spinnaker | Continuous delivery platform focused on application deployment |

## 2. Introduction to Jenkins

Jenkins is an open-source automation server used to automate software building, testing, and deployment. It supports Continuous Integration and Continuous Delivery (CI/CD).

### Why Use Jenkins?

- **Automation:** Automates repetitive development tasks.
- **Continuous Integration:** Helps validate code changes.
- **Extensibility:** Supports a large ecosystem of plugins.
- **Scalability:** Supports distributed builds using agents.

### Key Jenkins Concepts

1. **Job/Project:** A task or process executed by Jenkins.
2. **Build:** An execution of a configured job or pipeline.
3. **Pipeline:** A sequence of automated build, test, and deployment stages.
4. **Plugins:** Extensions that integrate Jenkins with other tools.
5. **Nodes and Agents:** Machines or environments that execute Jenkins tasks.

## 3. Jenkins Installation Using Docker

### Prerequisites

- Docker Desktop installed and running
- Visual Studio Code or a terminal
- A web browser

### Step 1: Download the Jenkins Image and Start a Container

Run the following command:

```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```

This command downloads the Jenkins LTS image if needed and starts a container.

- Port `8080` is used to access the Jenkins web interface.
- Port `50000` is commonly used for inbound agent connections.

### Step 2: Verify the Container

```bash
docker ps
```

Confirm that the Jenkins container is running and that port `8080` is mapped correctly.

### Step 3: Retrieve the Initial Administrator Password

```bash
docker exec jenkins sh -c "cat /var/jenkins_home/secrets/initialAdminPassword"
```

Copy the generated password locally for the initial setup. Do not commit the password to GitHub.

### Step 4: Access Jenkins

Open the following URL in your browser:

http://localhost:8080/

Enter the initial administrator password and follow the Jenkins setup wizard to install the suggested plugins and create an administrator account.

## 4. Installation Screenshots

The following screenshots document the Jenkins installation and initial configuration process.

### Unlock Jenkins

![Jenkins Unlock Screen](https://github.com/user-attachments/assets/1902e321-ac1b-4187-a046-ca996ddd546a)

### Jenkins Getting Started

![Jenkins Getting Started](https://github.com/user-attachments/assets/dff9c748-31cd-42f9-adee-3a5c5b317779)

### Jenkins Dashboard

![Jenkins Dashboard](https://github.com/user-attachments/assets/42839e8e-a592-4d1d-95a0-825ce3849970)

## 5. Result

Jenkins was installed and started using Docker. The initial administrator password was retrieved, and the Jenkins web interface was accessed through port `8080` to begin the initial configuration.

## Conclusion

Continuous Integration helps developers detect errors early through automated builds and tests. Jenkins provides a flexible platform for implementing CI/CD workflows, while Docker simplifies running Jenkins in an isolated container.
