FROM mosbie/dosbox-x

ENV RUN_XTERM=no
ENV DISPLAY_WIDTH=1024
ENV DISPLAY_HEIGHT=768

# COPY ./bin /opt/bin
COPY dosbox.conf /app/conf.d/
COPY ./assets/gwbasic.tar.gz /opt/dos/
COPY ./assets/gwbasic-master.zip /opt/dos/
COPY ./assets/devtools.tar.gz /opt/dos/

RUN tar -xzf /opt/dos/devtools.tar.gz -C /opt/dos/ && \
    rm /opt/dos/devtools.tar.gz
RUN unzip /opt/dos/gwbasic-master.zip -d /opt/dos/ && \
    rm /opt/dos/gwbasic-master.zip
RUN tar -xzf /opt/dos/gwbasic.tar.gz -C /opt/dos/ && \
    rm /opt/dos/gwbasic.tar.gz 

VOLUME /opt/dos/source
