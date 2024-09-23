# Docker DOSBox

This repository contains a Docker setup for running DOSBox, an x86 emulator with DOS.

## Prerequisites

- Docker installed on your machine.

## Getting Started

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/docker-dosbox.git
    cd docker-dosbox
    ```

2. Build the Docker image:
    ```sh
    docker build -t dosbox .
    ```

3. Run the Docker container:
    ```sh
    docker run -it dosbox
    ```

## Usage

Once the container is running, you can use DOSBox commands as you normally would.

## Using Docker Compose

You can also use Docker Compose to manage the container.

1. Create a `docker-compose.yml` file with the following content:
    ```yaml
    services:
      dosbox:
        build:
          context: .
          dockerfile: Dockerfile
        ports:
          - "8080:8080"
        volumes:
          - ./SRC:/opt/dos/source
        environment:
          - DISPLAY_WIDTH=1600
          - DISPLAY_HEIGHT=968
          - RUN_XTERM=no
    ```

2. Start the container using Docker Compose:
    ```sh
    docker-compose up
    ```

3. Stop the container:
    ```sh
    docker-compose down
    ```

This method simplifies the process of running and managing your Docker container.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgements

- [DOSBox](https://www.dosbox.com/) - The emulator used in this project.
- [Docker](https://www.docker.com/) - Containerization platform.