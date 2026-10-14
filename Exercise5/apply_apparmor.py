import docker

client = docker.from_env()

container = None

try:
    print("Building Docker image...")

    client.images.build(
        path=".",
        tag="flask-apparmor"
    )

    print("Starting container with AppArmor profile...")

    container = client.containers.run(
        "flask-apparmor",
        ports={"5000/tcp": 5000},
        security_opt=[
            "apparmor=my-apparmor-profile"
        ],
        detach=True
    )

    info = client.api.inspect_container(container.id)

    print("Container started:", container.short_id)
    print(
        "Configured security options:",
        info["HostConfig"].get("SecurityOpt")
    )
    print(
        "Active AppArmor profile:",
        info.get("AppArmorProfile")
    )

finally:
    if container is not None:
        container.stop()
        container.remove()
        print("Container stopped and removed.")