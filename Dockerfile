FROM centos
RUN yum update

RUN yum install perl -y
RUN yum install java -y 

ENV HOME=/var/tmp

RUN chmod -R 777 /var/tmp

COPY ./ $HOME/

RUN chmod +x $HOME/tassel.sh