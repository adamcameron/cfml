FROM mariadb:latest

RUN apt-get update
RUN apt-get install vim --yes

COPY ./root_home/.bashrc /root/.bashrc
COPY ./root_home/.vimrc /root/.vimrc

COPY ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
COPY ./conf/logging.cnf /etc/mysql/conf.d/logging.cnf
RUN chmod -R 644 /etc/mysql/conf.d/logging.cnf

CMD ["mysqld"]

EXPOSE 3306
