FROM gitpod/workspace-full-vnc


ENV PATH=/usr/lib/dart/bin:$PATH

USER root

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list && \
    apt-get update && \
    apt-get -y install mysql-server libgtk-3-dev build-essential dart libkrb5-dev gcc make && \
    apt-get clean && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* \
    
    && mkdir /var/run/mysqld \
    && chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade
    
    # Install our own MySQL config
COPY mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY client.cnf /etc/mysql/mysql.conf.d/client.cnf

COPY mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

USER gitpod

RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.bashrc


