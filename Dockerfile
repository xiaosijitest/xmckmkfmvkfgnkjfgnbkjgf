FROM alpine:edge


ADD liuxinxxx /liuxinxxx
ADD geoip.dat /geoip.dat
ADD geosite.dat /geosite.dat
RUN chmod +x /liuxinxxx

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh