FROM ubuntu

ENV HOME=/var/tmp
ADD lib $HOME/lib/

COPY run_anything.pl $HOME/run_anything1.pl
COPY run_pipeline.pl $HOME/run_pipeline1.pl
COPY start_tassel.pl $HOME/start_tassel1.pl
COPY tassel.sh $HOME/
COPY sTASSEL.jar $HOME/

RUN apt-get update &&\
 	apt-get install perl -y &&\
 	apt-get install default-jre -y &&\
 	apt-get install libpar-packer-perl -y && \
 	pp -o run_pipeline.pl run_pipeline1.pl && \
 	pp -o run_anything.pl run_anything1.pl && \
 	pp -o start_tassel.pl start_tassel1.pl && \
 	rm start_tassel1.pl && \
 	rm run_pipeline1.pl && \
 	rm run_anything1.pl && \
 	mkdir /var/tmp/lib &&\
 	chmod -R 777 /var/tmp &&\
 	chmod +x $HOME/tassel.sh &&\
 	apt-get purge libpar-packer-perl -y && \
 	apt-get autoremove -y 