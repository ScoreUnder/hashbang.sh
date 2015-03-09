FROM debian:wheezy

RUN apt-get update && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

ADD ./ /opt/app/
WORKDIR /opt/app
RUN pip install -r requirements.txt

EXPOSE 4443

CMD ["python", "server.py"]
