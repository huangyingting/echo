# Echo
A simple service returns HTTP request headers and body, support returning HTTP error code 404 or 503, get outbound public ip address etc.

## How to build it
`docker build -t repository/repo/image .`
A github workflow is also included to push image to ghcr.io

## How to run it
`docker run -it --rm -p 8080:8080 -e repository/repo/echo`

## How to use it
  ```shell
  # Get
  curl http://localhost:8080
  GET / HTTP/1.1
  Host: localhost:8080
  User-Agent: curl/7.58.0
  Accept: */*



  hostname: 1f0c0966e7c0
  remote_addr: 172.17.0.1
  version: v0.0.1
  elapsed: 0.000

  # Get outbound public ip
  curl http://localhost:8080/ip
  {
    "ip": "167.220.255.116",
    "ip_decimal": 2816278388,
    "country": "Singapore",
    "country_iso": "SG",
    "country_eu": false,
    "zip_code": "18",
    "city": "Singapore",
    "latitude": 1.2929,
    "longitude": 103.8547,
    "time_zone": "Asia/Singapore",
    "asn": "AS3598",
    "asn_org": "MICROSOFT-CORP-AS",
    "user_agent": {
      "product": "curl",
      "version": "7.80.0",
      "raw_value": "curl/7.80.0"
  }

  # HTTP error code 
  curl -i http://localhost:8080/503
  HTTP/1.1 503 Service Temporarily Unavailable
  Server: openresty/1.21.4.1
  Date: Thu, 08 Dec 2022 01:50:10 GMT
  Content-Type: text/plain
  Transfer-Encoding: chunked
  Connection: keep-alive

  Service Unavailable

  ```

## Deploy to kubernetes
Open echo.yaml, replace `echo.example.com` to `your echo domain name`, then

```shell
kubectl create ns echo
kubectl apply -f echo.yaml -n echo
```