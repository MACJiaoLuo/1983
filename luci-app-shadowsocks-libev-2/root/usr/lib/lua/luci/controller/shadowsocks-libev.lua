module("luci.controller.shadowsocks-libev",package.seeall)
function index()
if not nixio.fs.access("/etc/config/shadowsocks-libev")then
return
end
entry({"admin","services","shadowsocks-libev"},cbi("shadowsocks-libev"),_("ShadowSocks-libev"),74).dependent=true
end
