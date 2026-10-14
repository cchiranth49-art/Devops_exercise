# Docker Security with AppArmor and Python

## Objective
Secure a Python Flask application running in Docker by applying an AppArmor security profile and testing restricted operations through the Docker SDK for Python.

## Technologies
- Python
- Flask
- Docker
- AppArmor
- Docker SDK for Python
- Linux

## Project Structure
- `app.py` — Flask web application
- `Dockerfile` — Docker image configuration
- `requirements.txt` — Python dependencies
- `my-apparmor-profile` — AppArmor policy
- `apply_apparmor.py` — Build, run, and inspect the container
- `test_restricted_actions.py` — Test restricted operations

## Prerequisites
- Docker Engine
- Linux host with AppArmor enabled
- Python and pip
- AppArmor utilities

## Setup

Install the required Linux packages:

```bash
sudo apt-get update
sudo apt-get install apparmor apparmor-utils
```

Install Python dependencies:

```bash
pip install -r requirements.txt
```

Build the Docker image:

```bash
docker build -t flask-apparmor .
```

Install the profile on the Linux host:

```bash
sudo cp my-apparmor-profile /etc/apparmor.d/my-apparmor-profile
sudo apparmor_parser -r /etc/apparmor.d/my-apparmor-profile
```

Run the Python scripts:

```bash
python apply_apparmor.py
python test_restricted_actions.py
```

## Verification
Inspect the container configuration and check the host's AppArmor status and audit logs. A configured profile name alone does not prove that all restrictions work.

## Learning Outcomes
- Docker image creation and container management
- Linux mandatory access control
- AppArmor profile configuration
- Container inspection using the Docker SDK
- Testing security restrictions

## Limitations
AppArmor is Linux-specific. Profile rules must be validated against the actual image, and restricted operations must be tested to distinguish AppArmor denials from ordinary permission errors or missing programs.
