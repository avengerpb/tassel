FROM centos


ENV HOME=/var/tmp
ADD lib $HOME/lib/

COPY run_anything.pl $HOME/
COPY run_pipeline.pl $HOME/
COPY start_tassel.pl $HOME/
COPY tassel.sh $HOME/
COPY sTASSEL.jar $HOME/

RUN yum update &&\
 	yum install perl -y &&\
 	yum install java -y &&\
 	mkdir /var/tmp/lib &&\
 	chmod -R 777 /var/tmp &&\
 	chmod +x $HOME/tassel.sh &&\