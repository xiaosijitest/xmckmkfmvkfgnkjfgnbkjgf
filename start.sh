#!/bin/sh

# configs
AUUID=c0b3ef90-3402-11ec-8d3d-0242ac130003
CADDYIndexPage=https://github.com/AYJCSGM/mikutap/archive/master.zip
CONFIGCADDY=https://raw.githubusercontent.com/xiaosijitest/xmckmkfmvkfgnkjfgnbkjgf/master/etc/Caddyfile
# CONFIGLIUXINXXX=https://raw.githubusercontent.com/xiaosijitest/xmckmkfmvkfgnkjfgnbkjgf/master/etc/liuxinxxx.json
ParameterSSENCYPT=chacha20-ietf-poly1305
# StoreFiles=https://raw.githubusercontent.com/xiaosijitest/xmckmkfmvkfgnkjfgnbkjgf/master/etc/StoreFiles
#PORT=4433
mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt
wget $CADDYIndexPage -O /usr/share/caddy/index.html && unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/
wget -qO- $CONFIGCADDY | sed -e "1c :$PORT" -e "s/\$AUUID/$AUUID/g" -e "s/\$MYUUID-HASH/$(caddy hash-password --plaintext $AUUID)/g" >/etc/caddy/Caddyfile
# wget -qO- $CONFIGLIUXINXXX | sed -e "s/\$AUUID/$AUUID/g" -e "s/\$ParameterSSENCYPT/$ParameterSSENCYPT/g" >/liuxinxxx.json

# # storefiles
# mkdir -p /usr/share/caddy/$AUUID
# mv /StoreFiles /usr/share/caddy/$AUUID/StoreFiles
# wget -P /usr/share/caddy/$AUUID -i /usr/share/caddy/$AUUID/StoreFiles

# for file in $(ls /usr/share/caddy/$AUUID); do
#     [[ "$file" != "StoreFiles" ]] && echo \<a href=\""$file"\" download\>$file\<\/a\>\<br\> >>/usr/share/caddy/$AUUID/ClickToDownloadStoreFiles.html
# done

# # start
# tor &
ls
/liuxinxxx -config /liuxinxxx.json &

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
