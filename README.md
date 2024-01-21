# Yggdrasil in Docker
This is yet another implementation of Yggdrasil in Docker

## Starting
1. Clone repo and generate default Yggdrasil configuration:
    ```sh
    git clone https://github.com/WGOS/yggdrasil-docker.git
    mkdir ./conf
    docker compose run yggdrasil yggdrasil -genconf > conf/yggdrasil.conf
    ```
2. Pick some peers and from [public list](https://github.com/yggdrasil-network/public-peers)
3. Run: `docker compose up -d`