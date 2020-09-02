FROM alpine

RUN apk --update add --no-cache \
  bash \
  wget

ADD script.sh /bin/

RUN chmod +x /bin/script.sh

ENTRYPOINT /bin/script.sh