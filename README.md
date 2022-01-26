# oracle-tf
### [source and config](https://github.com/hitrov/oci-arm-host-capacity)

* build
  * $ docker login
  * $ docker buildx build --platform linux/arm64,linux/amd64 -t DOCKER/IMAGENAME:IMAGETAG -o type=registry .

* run
  * $ docker create --name machine DOCKER/IMAGENAME:IMAGETAG
  * $ docker cp your-private-file.pem machine:/app/oci-arm-host-capacity 
  * $ docker cp .env machine:/app/oci-arm-host-capacity 
  * $ docker start machine
