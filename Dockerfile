FROM alpine:edge
RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget

ADD liuxinxxx /liuxinxxx
ADD geoip.dat /geoip.dat
ADD geosite.dat /geosite.dat
RUN chmod +x /liuxinxxx

ADD /etc/StoreFiles /StoreFiles
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh