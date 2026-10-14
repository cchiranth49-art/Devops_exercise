import docker

client = docker.from_env()
container = None

try:
    container = client.containers.run(
        "flask-apparmor",
        security_opt=[
            "apparmor=my-apparmor-profile"
        ],
        detach=True
    )

    print("Container started:", container.short_id)

    tests = [
        ["cat", "/etc/shadow"],
        ["/bin/bash", "-c", "echo test"]
    ]

    for command in tests:
        result = container.exec_run(command)

        print("\nCommand:", " ".join(command))
        print("Exit code:", result.exit_code)

        output = result.output
        if output:
            print(
                output.decode(
                    "utf-8",
                    errors="replace"
                )
            )

finally:
    if container is not None:
        container.stop()
        container.remove()
        print("Container stopped and removed.")