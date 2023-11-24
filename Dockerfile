FROM php:7.4.33-fpm

COPY ./ /app

WORKDIR "/app"

RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin && \
        echo "alias composer='composer'" >> /root/.bashrc

RUN apt-get update -y
RUN apt-get -y --no-install-recommends install git

    #php7.4-redis php7.4-xdebug php7.4-imagick php7.4-intl php7.4-gd \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*


# Fix debconf warnings upon build
#ARG DEBIAN_FRONTEND=noninteractive

#ENV TZ 'Europe/Kiev'

#RUN apt-get update -y

#RUN apt-get install -y git

#RUN apt-get install libjpeg62-turbo-dev -y

#RUN apt-get install libpng-dev -y

#RUN apt-get install libfreetype6 libfreetype6-dev -y

#RUN echo $TZ > /etc/timezone && \
#    apt-get update && apt-get install -y tzdata && \
#    rm /etc/localtime && \
#    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
#    dpkg-reconfigure -f noninteractive tzdata && \
#    apt-get clean

# Install selected extensions and other stuff
#RUN apt-get update \
#    && apt-get -y --no-install-recommends install php7.4-mysql php7.4-redis php7.4-xdebug php7.4-imagick php7.4-intl php7.4-gd \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install git
#RUN apt-get update \
#    && apt-get -y install git \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Configure non-root user.
#ARG PUID=1000
#ARG PGID=1000
#RUN groupmod -o -g ${PGID} www-data && \
#    usermod -o -u ${PUID} -g www-data www-data

# https://sphinxsearch.com/blog/
#ENV SPHINX_VERSION 3.1.1-612d99f

# set up and expose directories
#RUN mkdir -pv /usr/locale/sphinx/log /usr/locale/sphinx/index
#VOLUME /usr/locale/sphinx/index
#VOLUME /var/sphinx/data

#ENV XDEBUG_MODE=coverage