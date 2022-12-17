FROM python:3.10-bullseye

WORKDIR /opt/oracle

RUN apt-get update && apt-get install -y wget unzip libaio1


RUN wget https://download.oracle.com/otn_software/linux/instantclient/191000/instantclient-basic-linux.arm64-19.10.0.0.0dbru.zip && \
    unzip instantclient-basic-linux.arm64-19.10.0.0.0dbru.zip && \
    rm -f instantclient-basic-linux.arm64-19.10.0.0.0dbru.zip && \
    cd /opt/oracle/instantclient_19_10 && \
    echo /opt/oracle/instantclient_19_10 > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    export PATH=$PATH:/opt/oracle/instantclient_19_10 && \
    ldconfig && \
    echo $PATH

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .


COPY startup.sh .
RUN chmod +x startup.sh

CMD [ "/bin/bash", "-c", "./startup.sh" ]
# CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]

