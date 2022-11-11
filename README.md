# Echo
A simple service returns HTTP request headers and body.

## How to build it
`docker build -t repo/image .`

## How to run it
`docker run -it --rm -p 8080:8080 -e VERSION=v1 huangyingting/echo`

## How to test it
  ```ShellSession
  curl -X POST http://localhost:8080 -H 'Content-Type: application/json' -d '{"hello":"world"}'
  POST / HTTP/1.1
  Host: localhost:8080
  User-Agent: curl/7.58.0
  Accept: */*
  Content-Type: application/json
  Content-Length: 17


  {"hello":"world"}
  hostname: 26f40970ffd9
  remote_addr: 172.17.0.1
  version: v1
  ```
