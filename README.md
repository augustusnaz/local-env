This repo was created for managing local development services for and Laravel and Node.js. See [this link](https://blog.devgenius.io/multi-laravel-sail-sites-with-custom-domain-e13c07d9dd0c) for the inspiration for using [Nginx Proxy Manager](https://github.com/jc21/nginx-proxy-manager) as the reverse proxy.

**Requirements**:
* Docker
* Docker Compose
* openssl (for generating self signed certs)

**Services**:
* Nginx Proxy Manager
* mysql
* adminer
* memcached
* redis

## Usage

Copy and update env
```bash
cp example.env .env
```
```bash
docker-compose up -d
```

## Nginx Proxy Manager

***Default Login***

*Email: admin@example.com*
*Password: changeme*

**Note**:
* Added proxy hosts should also be configured in `host` file
* If having problems with new Proxy Hosts and Docker is installed, use `host.docker.internal` as the forward hostname/IP.

## SSL Certificates
The `ssl/crt.sh` script allows easily creating SSL self-issued SSL certificates.

Generated certificates should be added to your browser's **Trusted Root Certification Authorities** and to the **Proxy Manager**.

Usage:

```bash
cd ssl
```
Create a new configuration (e.g. `my-domain.conf`) and run the script
```bash
cp my-domain-example.conf my-domain.conf
```
Update the configuration and run the script:
```bash
./crt.sh my-domain
```

For details on the script, run:
```bash
./crt.sh help
```

