# Ngrok For Docker

## Download

```bash
# clone
git clone https://github.com/zhaopan/ngrok-for-docker.git
```

## Init

```bash
cd ngrok-for-docker

# Copy Docker.env
cp .env.example .env
```

## Build

```bash
# Dockerfile build
docker build -t zhaopan/ngrok .
#
# or docker-compose
#
docker-compose up --build
```

## Run

* you must mount your folder (E.g `/mnt/docker/data/ngrok`) to container `/myfiles`
* if it is the first run, it will generate the binaries file and CA in your floder `/mnt/docker/data/ngrok`
* Wait a few minutes for the first startup, because you have to wait for the go compiler to complete the compilation

### Run-Init

```bash
# Mkdir ngrok data floder
mkdir -p /mnt/docker/data/ngrok
```

### Runing

```bash
# run Dockerfile
docker run -idt \
--restart=always \
--name=ngrok-server \
-v /mnt/docker/data/ngrok:/myfiles \
-e DOMAIN=<ngrok.website.com> zhaopan/ngrok /bin/sh /server.sh
#
# or run docker-compose
#
docker-compose up -d
```

## Config Client for Windows

* client folder(E.g `windows_amd64_client`)

```bash
bin #ngrok.exe for windows_amd64
    ngrok.exe
conf #cfg folder
    ngrok-website.yml #cfg
logs
    ...#log files
start.ngrok.bat #windows bat
```

* ngrok.yml

```yml
server_addr: <ngrok.website.com>:4443
trust_host_root_certs: false
tunnels:
  mstsc:
    subdomain: 13389
    proto:
      http: 127.0.0.1:3389
  web:
    subdomain: web
    proto:
      http: 8080
```

* start.ngrok.bat

```bat
bin\ngrok -config=conf\ngrok-website.yml -log=logs\ngrok_log.txt start mstsc web
```

### Run

* Double-click to run the `start.ngrok.bat` file to start the ngrok agent

## Thanks

[hteen/docker-ngrok](https://github.com/hteen/docker-ngrok)

[inconshreveable/ngrok](https://github.com/inconshreveable/ngrok)

[winsw/winsw](https://github.com/winsw/winsw)

[ogenes/docker-lnmp](https://github.com/ogenes/docker-lnmp)

## Reference Link

[golang](https://github.com/golang/go)

[ngrok-docs](https://ngrok.com/docs)

[cxz001](https://my.oschina.net/cxz001/blog/784620)
