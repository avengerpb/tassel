FROM centos
RUN yum update

RUN yum install perl -y
RUN yum install java -y 

ENV HOME=/var/tmp

RUN chmod -R 777 /var/tmp

COPY run_anything.pl $HOME/
COPY run_pipeline.pl $HOME/
COPY start_tassel.pl $HOME/
COPY tassel.sh $HOME/
COPY sTASSEL.jar $HOME/
COPY lib/ $HOME/

RUN chmod +x $HOME/tassel.sh