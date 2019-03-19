# rpi-busybox-httpd

Raspberry Pi compatible Docker Image with a minimal `Busybox httpd` web server.


## Details
- [Source Project Page](https://github.com/hypriot)
- [Source Repository](https://github.com/hypriot/rpi-busybox-httpd)

## Start the default web server
```bash
docker run -d -p 8080:80 hypriot/rpi-busybox-httpd
```
Or use the script `start-webservers.sh count [start]` to start many web servers, port number uses 10000+n
```bash
./start-webservers.sh 5
./start-webservers.sh 10 5
```

## How to create this image

Run all the commands from within the project root directory.

This Docker Image is extremely small (approx. 2.1MByte) and will be build with the tool [dockerize](https://github.com/larsks/dockerize).

### Install the build dependencies first
```bash
./install-deps.sh
```

### Build the Docker Image
```bash
make build
```

#### Test the Docker Image
```bash
make test
```

#### Push the Docker Image to the Docker Hub
* First use a `docker login` with username, password and email address
* Second push the Docker Image to the official Docker Hub

```bash
make push
```

---------------------------------------------------------------------
Now use apache-httpd for httpd server 
run with docker-compsoe
```bash
docker-compose up --build
```

## Make you own change for httpd server
  Modified the configure files in [conf](/conf)
  
## You can change the docker-compose.yml to suit your work
```bash
version: '2.0'

services:
  httpd:
    build: .
    environment:
      TZ: 'EST5EDT'
    networks:
      - default
    read_only: false 
    tmpfs:
      - /tmp
    restart: unless-stopped
    stdin_open: true
    tty: true
    ports:
      - "80:80"
    volumes:
      - /home/user/share/path:/usr/local/apache2/htdocs/
networks:
  default:
```

## Buy us a beer!

This FLOSS software is funded by donations only. Please support us to maintain and further improve it!

<a href="https://liberapay.com/Hypriot/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a>


## License

The MIT License (MIT)

Copyright (c) 2015 Hypriot

Copyright (c) 2019 sndnvaps

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
