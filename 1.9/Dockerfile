#
# Builds a docker image for i-doit 1.9
#
FROM ubuntu:14.04
ENV idoit_home /var/www/i-doit
ENV idoit_download_url https://sourceforge.net/projects/i-doit/files/i-doit/1.9/idoit-open-1.9.zip/download

COPY policy-rc.d /usr/sbin/policy-rc.d

RUN apt-get update && apt-get dist-upgrade -y

# install wget
RUN apt-get update && apt-get install -y -q wget

# install mysql 5.6
RUN apt-get update && apt-get install -y -q mysql-server-5.6

# configure mysql 5.6 for i-doit 1.9
COPY mysql-for-i-doit-1-9.cnf /etc/mysql/conf.d

# install required packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q  \
	apache2 \
	libapache2-mod-php5 \
	curl \
	php5 \
	php5-cli \
	php5-xmlrpc \
	php5-ldap \
	php5-gd \
	php5-mysql \
	php5-curl \
	mcrypt \
	php5-mcrypt \
	unzip \
	supervisor

# enable mcrypt in php5
RUN php5enmod mcrypt

# create the home directory for i-doit
RUN mkdir -p ${idoit_home}

# fix two php configuration options, required for i-doit
RUN sed -i \
	-e "s#; max_input_vars = 1000#max_input_vars = 10000#" \
	-e "s#post_max_size = 8M#post_max_size = 128M#" \
	/etc/php5/apache2/php.ini

# make sure apache module mod_rewrite is enabled
RUN a2enmod rewrite

# download i-doit 1.9 and upack it
RUN wget -O i-doit.zip ${idoit_download_url} \
	&&  unzip i-doit.zip -d ${idoit_home} \
	&& rm i-doit.zip

# default rights
RUN chmod +x ${idoit_home}/idoit-rights.sh
RUN cd ${idoit_home} && ./idoit-rights.sh

# apache2 configuration for the virtual host on port 80
# includes the alias definition for '/i-doit'
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

# expose i-doit webinterface running on port 80
EXPOSE 80

# install configuration file for supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
