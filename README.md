# oracle-tf
### [source and config](https://github.com/hitrov/oci-arm-host-capacity)

* build
  * docker buildx build --platform linux/arm64,linux/amd64 -t hassegawa/machine:0.1.1 -o type=registry .

* run
  * $ docker login
  * $ docker create --name machine -p 8080:80 hassegawa/machine:0.1.1

  * $ docker cp your-private-file.pem machine:/app/oci-arm-host-capacity 
  * $ docker cp .env machine:/app/oci-arm-host-capacity 
  * $ docker start machine
