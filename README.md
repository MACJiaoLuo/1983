﻿








---20150923---
添加了 luci-app-shadowsocks-libev shadowsocks-libev 因为 1505 没有这个 ss

---20150924---
packages\net 里面添加了 aircrack-ptw
packages\net 里面添加了 libpcap --- 这个是可以 pin 的 1.1.12 版本

---20150929---
添加了 Gmediarender 音乐推送插件

---20151003---
添加了 luci-app-mjpg-streamer 里面自带全中文的 webcam(在/www/webcam)


---20151121---
添加了 luci-app-shadowsocks-libev-2 多了功能的(黑白名单)




Add this line to your feeds.conf.default.

    src-git 1983 git://github.com/openwrt-1983/1983.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
