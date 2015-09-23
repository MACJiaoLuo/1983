


20150923 添加了 luci-app-shadowsocks-libev shadowsocks-libev 因为 1505 没有这个 ss


Add this line to your feeds.conf.default.

    src-git 1983 git://github.com/openwrt-1983/1983.git 

And run

    ./scripts/feeds update -a && ./scripts/feeds install -a
