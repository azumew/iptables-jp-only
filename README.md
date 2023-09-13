# iptables-jp-only
ACCEPT_FILTERチェインにJPのIPアドレスを追加するスクリプトです。
- 事前にACCEPT_FILTERチェインを作成しておく必要があります。
- 起動時に自動的にリストを更新するため`/etc/rc.local`を利用します。

inspired by https://pcvogel.sarakura.net/2013/06/02/31142

# How to use
1. Do jp_only.sh
```
./jp_only.sh
```

2. Edit `/etc/iptables/rules.v4`
```
vi /etc/iptables/rules.v4

■Add chain (must)
:ACCEPT_FILTER - [0:0]

■Add rule (example)
-A INPUT -p tcp -m tcp --dport 8123 -m state --state NEW -j ACCEPT_FILTER
-A INPUT -p tcp -m tcp --dport 25565 -m state --state NEW -j ACCEPT_FILTER
-A INPUT -p udp -m udp --dport 51820 -m state --state NEW -j ACCEPT_FILTER
```

3. Edit `/etc/rc.local`
```
echo "/root/jp_only.sh" >> /etc/rc.local
chmod +x /etc/rc.local
```
