## vim:set ft=dockerfile:
#
# Builds a docker image for i-doit 1.9
#

################################ OS & PACKAGES ###########################
FROM debian:9
ENV idoit_home /var/www/i-doit
ENV idoit_download_url https://sourceforge.net/projects/i-doit/files/i-doit/1.9.3/idoit-open-1.9.3.zip/download

COPY policy-rc.d /usr/sbin/policy-rc.d

RUN apt-get update && apt-get dist-upgrade -y

# install tools
RUN apt-get update && apt-get install -y -q wget vim telnet tcpdump sudo

#### install database
###RUN apt-get update && apt-get install -y -q mariadb-client mariadb-server 


# install required packages
RUN set -x && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q  \
	apache2 \
	libapache2-mod-php \
	php \
	php-bcmath \
	php-cli \
	php-common \
	php-curl \
	php-gd \
	php-imagick \
	php-json \
	php-ldap \
	php-mcrypt \
	php-memcached \
	php-mysql \
	php-soap \
	php-xml \
	php-zip \
	php-xmlrpc \
	mcrypt \
	unzip \
	curl \
	moreutils \
	supervisor
################################## DATABASE #######################
#### configure database for i-doit
###COPY mysql-for-i-doit-1-9.cnf /etc/mysql/conf.d
################################ PHP ###########################
## enable mcrypt in php5
#RUN php5enmod mcrypt
#RUN phpenmod memcached
# configure php for i-doit
################ --> moved to mysql official docker image

COPY php-for-i-doit.ini /etc/php/7.0/mods-available
RUN phpenmod php-for-i-doit

################################ i-doit ###########################
# create the home directory for i-doit
RUN mkdir -p ${idoit_home}

## fix two php configuration options, required for i-doit
#RUN sed -i \
#	-e "s#; max_input_vars = 1000#max_input_vars = 10000#" \
#	-e "s#post_max_size = 8M#post_max_size = 128M#" \
#	/etc/php5/apache2/php.ini


# download i-doit 1.9 and upack it
RUN wget -O i-doit.zip ${idoit_download_url} \
	&&  unzip i-doit.zip -d ${idoit_home} \
	&& rm i-doit.zip

# default rights
RUN chmod +x ${idoit_home}/idoit-rights.sh
RUN cd ${idoit_home} && ./idoit-rights.sh

RUN ln -s /var/www/i-doit/ /var/www/html/i-doit
################################ APACHE ###########################
# apache2 configuration for the virtual host on port 80
# includes the alias definition for '/i-doit'
#COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
RUN a2dissite 000-default
COPY apache-for-i-doit.conf /etc/apache2/sites-available
RUN a2ensite apache-for-i-doit
RUN a2enmod rewrite

################################ DOCKER ###########################
# expose i-doit webinterface running on port 80
EXPOSE 80

############################### "INIT" ############################
#ENV APACHE_CONFDIR /etc/apache2
#ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars

COPY apache2-foreground /usr/local/bin/
WORKDIR /var/www/html
CMD ["apache2-foreground"]
