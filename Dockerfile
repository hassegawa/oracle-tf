FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive 

# first build to generate this layer
RUN apt update && apt install -y git php-cli php-curl php-xml jq nano unzip curl && \
    mkdir /compose && \
    useradd -r -s /bin/false ubuntu; \
    groupadd docker; \
    usermod -aG docker ubuntu;

# SECOND build to generate this layer, uncomment after first build and build again
# RUN cd /compose && \
#     curl -sS https://getcomposer.org/installer -o composer-setup.php && \
#     HASH=`curl -sS https://composer.github.io/installer.sig` && \
#     php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
#     php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
#     mkdir /app

# THIRT build to generate this layer, uncommnet after second build and build again
# RUN cd /app && \ 
#     git clone https://github.com/hassegawa/oci-arm-host-capacity.git && \
#     cd oci-arm-host-capacity && \
#     composer update && \
#     composer install && \
#     chown ubuntu:ubuntu /app/oci-arm-host-capacity

WORKDIR /app/oci-arm-host-capacity   

USER ubuntu    

COPY run.sh run.sh
CMD ./run.sh