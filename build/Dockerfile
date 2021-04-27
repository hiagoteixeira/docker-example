FROM ubuntu:20.04

# Atualizando repositórios e adicionando repositorio do PHP7.3
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update

# Instalando utilitários
RUN apt install -y sudo vim

# Instalando serviços
RUN apt-get install -y apache2
RUN apt-get install -y libxml2 libxml2-dev libpng-dev libjpeg-dev
RUN apt-get install -y php7.3 php7.3-json php7.3-mysql php7.3-mbstring php7.3-xml php7.3-gd php7.3-redis php7.3-xdebug php7.3-curl php7.3-intl
RUN apt-get install -y composer

# Ajustando timezone do container
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/timezone

# Habilitando modulos do apache
RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http

# Configurações do apache
# COPY ./apache2/ports.conf /etc/apache2/
COPY ./docker/build/apache2/sites /etc/apache2/sites-enabled/

# Configurações do php
# COPY ./php/php.ini /etc/php/7.3/apache2/
# COPY ./php/php.ini /etc/php/7.3/cli/
# COPY ./php/xdebug.ini /etc/php/7.3/apache2/conf.d/
# COPY ./php/xdebug.ini /etc/php/7.3/cli/conf.d/

# Script de inicialização dos serviços
COPY ./docker/build/start.sh /start.sh
RUN chmod +x /start.sh

# Criando um usuário comum com permissões de root
RUN useradd -ms /bin/bash default
RUN usermod -aG sudo default
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Definindo diretório de trabalho e usuário padrão.
USER default
WORKDIR /var/www

CMD ["/start.sh"] 
