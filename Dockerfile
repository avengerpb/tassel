
FROM alpine

ENV HOME=/var/tmp
WORKDIR $HOME
ADD lib $HOME/lib/

COPY run_anything.pl $HOME/
COPY run_pipeline.pl $HOME/
COPY start_tassel.pl $HOME/
COPY tassel.sh $HOME/
COPY sTASSEL.jar $HOME/

RUN apk add --update perl && rm -rf /var/cache/apk/* &&\
    apk --update add openjdk7-jre  &&\
    chmod -R 777 /var/tmp &&\
    chmod +x $HOME/tassel.sh