# iptables-jp-only
Copy by https://pcvogel.sarakura.net/2013/06/02/31142

# How to use
1. Do jp_only.sh
```
./jp_only.sh
```

2. Edit `/etc/iptables/rules.v4`
```
■example
-A INPUT -p tcp -m tcp --dport 8123 -m state --state NEW -j ACCEPT_FILTER
-A INPUT -p tcp -m tcp --dport 25565 -m state --state NEW -j ACCEPT_FILTER
-A INPUT -p udp -m udp --dport 51820 -m state --state NEW -j ACCEPT_FILTER
```

# How to do in launch
```
echo "/root/jp_only.sh" >> /etc/rc.local
```
