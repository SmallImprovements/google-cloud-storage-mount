FROM alpine:3.7
ENV VERSION_GSUTIL=4.28

RUN apk --no-cache add\
    python\
    py-crcmod\
    ca-certificates\
    wget

RUN mkdir -p /opt\
      && wget -qO- https://storage.googleapis.com/pub/gsutil_$VERSION_GSUTIL.tar.gz\
       | tar -xzC /opt

ENV PATH /opt/gsutil:$PATH

COPY boto /root/.boto
COPY docker-entrypoint.sh /

ENTRYPOINT /docker-entrypoint.sh