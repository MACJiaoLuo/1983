local a,t,e,o,i
if luci.sys.call("pidof ss-redir ss-local >/dev/null")==0 then
a=Map("shadowsocks-libev",translate("ShadowSocks-libev"),translate("ShadowSocks-libev is running"))
else
a=Map("shadowsocks-libev",translate("ShadowSocks-libev"),translate("ShadowSocks-libev is not running"))
end
t=a:section(TypedSection,"shadowsocks-libev",translate("Global Setting"))
t.anonymous=true
e=t:option(Flag,"enable",translate("Enable"))
e.default=1
e.rmempty=false
e=t:option(Value,"server",translate("Server Address"))
e.datatype="host"
e.rmempty=false
e=t:option(Value,"server_port",translate("Server Port"))
e.datatype="port"
e.rmempty=false
e=t:option(Value,"local_port",translate("Local Port"))
e.datatype="port"
e.default=1080
e.rmempty=false
e=t:option(Value,"timeout",translate("Connection Timeout"))
e.datatype="uinteger"
e.default=60
e.rmempty=false
e=t:option(Value,"password",translate("Password"))
e.password=true
e.rmempty=false
o={
"table",
"rc4",
"rc4-md5",
"aes-128-cfb",
"aes-192-cfb",
"aes-256-cfb",
"bf-cfb",
"camellia-128-cfb",
"camellia-192-cfb",
"camellia-256-cfb",
"cast5-cfb",
"des-cfb",
"idea-cfb",
"rc2-cfb",
"seed-cfb",
"salsa20",
"chacha20",
}
e=t:option(ListValue,"encrypt_method",translate("Encrypt Method"))
for a,t in ipairs(o)do
e:value(t)
end
e.rmempty=false
t=a:section(TypedSection,"shadowsocks-libev",translate("Proxy Setting"))
t.anonymous=true
e=t:option(ListValue,"redir_or_local",translate("Proxy Method"),
translate("Use ss-redir or ss-local"))
e:value("0",translate("Transparent Proxy"))
e:value("1",translate("Local Socks5 Proxy"))
e.rmempty=false
e=t:option(ListValue,"udp_relay",translate("Proxy Protocol"))
e:value("0",translate("TCP only"))
e:value("1",translate("TCP+UDP"))
e.default="0"
e:depends("redir_or_local","0")
e=t:option(Value,"ignore_list",translate("Ignore List"))
e:value("/dev/null",translate("Disabled"))
e:value("/etc/chinadns_chnroute.txt",translate("CHNRoute File"))
e.default="/etc/chinadns_chnroute.txt"
e:depends("redir_or_local","0")
t=a:section(TypedSection,"shadowsocks-libev",translate("UDP Forward"))
t.anonymous=true
e=t:option(Flag,"tunnel_enable",translate("Enable"))
e.default=0
e.rmempty=false
e=t:option(Value,"tunnel_port",translate("UDP Local Port"))
e.datatype="port"
e.default=5300
e:depends("tunnel_enable","1")
e=t:option(Value,"tunnel_forward",translate("Forwarding Tunnel"))
e.default="8.8.4.4:53"
e:depends("tunnel_enable","1")
t=a:section(TypedSection,"shadowsocks-libev",translate("Access Control"))
t.anonymous=true
t:tab("lan_ac",translate("LAN"))
e=t:taboption("lan_ac",ListValue,"lan_ac_mode",translate("Access Control"))
e:value("0",translate("Disabled"))
e:value("1",translate("Allow listed only"))
e:value("2",translate("Allow all except listed"))
e.default=0
e.rmempty=false
i=luci.sys.net.arptable()or{}
e=t:taboption("lan_ac",DynamicList,"lan_ac_ip",translate("LAN IP List"))
e.datatype="ipaddr"
for o,a in ipairs(i)do
e:value(a["IP address"])
end
t:tab("wan_ac",translate("WAN"))
e=t:taboption("wan_ac",DynamicList,"wan_bp_ip",translate("Bypassed IP"))
e.datatype="ip4addr"
e=t:taboption("wan_ac",DynamicList,"wan_fw_ip",translate("Forwarded IP"))
e.datatype="ip4addr"
return a
