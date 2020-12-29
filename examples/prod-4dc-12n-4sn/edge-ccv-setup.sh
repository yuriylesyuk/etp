#
## reset CONSUL_ custom chains
#
set +e
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t filter -F CONSUL_INPUT"
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t filter -X CONSUL_INPUT"
set -e
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t filter -N CONSUL_INPUT"
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t filter -A INPUT -p tcp -j CONSUL_INPUT"

set +e
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -F CONSUL_OUTPUT"
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -X CONSUL_OUTPUT"
set -e
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -N CONSUL_OUTPUT"
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A OUTPUT -p tcp -j CONSUL_OUTPUT"
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --uid-owner consul -j RETURN"
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --gid-owner consul -j RETURN"

#
## node traffic control
#

ansible dc1n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc3n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc3n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc3n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc3n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc3n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc3n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc4n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc4n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc4n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc4n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc4n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc4n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

#


#
## client nodes sidecars
#
#
## configuration for edge-zk-2181
#
ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.11 --dport 2181 -j DNAT --to-destination 127.0.0.1:30211"
ansible dc1n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.1.11:2181"
# file: "edge-dc1n01-zk-2181.json"
ansible dc1n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n01-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n01-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n01-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.12 --dport 2181 -j DNAT --to-destination 127.0.0.1:30212"
ansible dc1n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.1.12:2181"
# file: "edge-dc1n02-zk-2181.json"
ansible dc1n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n02-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n02-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n02-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.13 --dport 2181 -j DNAT --to-destination 127.0.0.1:30213"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.1.13:2181"
# file: "edge-dc1n03-zk-2181.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n03-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.11 --dport 2181 -j DNAT --to-destination 127.0.0.1:30214"
ansible dc2n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.2.11:2181"
# file: "edge-dc2n01-zk-2181.json"
ansible dc2n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n01-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n01-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n01-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.12 --dport 2181 -j DNAT --to-destination 127.0.0.1:30215"
ansible dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.2.12:2181"
# file: "edge-dc2n02-zk-2181.json"
ansible dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n02-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n02-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n02-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.13 --dport 2181 -j DNAT --to-destination 127.0.0.1:30216"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.2.13:2181"
# file: "edge-dc2n03-zk-2181.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n03-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.11 --dport 2181 -j DNAT --to-destination 127.0.0.1:30217"
ansible dc3n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.3.11:2181"
# file: "edge-dc3n01-zk-2181.json"
ansible dc3n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n01-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc3n01-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n01-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.12 --dport 2181 -j DNAT --to-destination 127.0.0.1:30218"
ansible dc3n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.3.12:2181"
# file: "edge-dc3n02-zk-2181.json"
ansible dc3n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n02-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc3n02-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n02-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.13 --dport 2181 -j DNAT --to-destination 127.0.0.1:30219"
ansible dc3n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.3.13:2181"
# file: "edge-dc3n03-zk-2181.json"
ansible dc3n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n03-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc3n03-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n03-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.11 --dport 2181 -j DNAT --to-destination 127.0.0.1:30220"
ansible dc4n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.4.11:2181"
# file: "edge-dc4n01-zk-2181.json"
ansible dc4n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n01-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc4n01-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n01-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.12 --dport 2181 -j DNAT --to-destination 127.0.0.1:30221"
ansible dc4n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.4.12:2181"
# file: "edge-dc4n02-zk-2181.json"
ansible dc4n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n02-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc4n02-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n02-zk-2181.pid'

ansible  -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.13 --dport 2181 -j DNAT --to-destination 127.0.0.1:30222"
ansible dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.100.4.13:2181"
# file: "edge-dc4n03-zk-2181.json"
ansible dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n03-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc4n03-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n03-zk-2181.pid'

ansible  --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2181 &> /opt/hashicorp/consul/logs/edge-zk-2181.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2181.pid'
#


#
## configuration for edge-zk-2888
#
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.11 --dport 2888 -j DNAT --to-destination 127.0.0.1:30281"
ansible dc1n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.1.11:2888"
# file: "edge-dc1n01-zk-2888.json"
ansible dc1n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n01-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n01-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n01-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.12 --dport 2888 -j DNAT --to-destination 127.0.0.1:30282"
ansible dc1n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.1.12:2888"
# file: "edge-dc1n02-zk-2888.json"
ansible dc1n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n02-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n02-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n02-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.13 --dport 2888 -j DNAT --to-destination 127.0.0.1:30283"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.1.13:2888"
# file: "edge-dc1n03-zk-2888.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n03-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.11 --dport 2888 -j DNAT --to-destination 127.0.0.1:30284"
ansible dc2n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.2.11:2888"
# file: "edge-dc2n01-zk-2888.json"
ansible dc2n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n01-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n01-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n01-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.12 --dport 2888 -j DNAT --to-destination 127.0.0.1:30285"
ansible dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.2.12:2888"
# file: "edge-dc2n02-zk-2888.json"
ansible dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n02-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n02-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n02-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.13 --dport 2888 -j DNAT --to-destination 127.0.0.1:30286"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.2.13:2888"
# file: "edge-dc2n03-zk-2888.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n03-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.11 --dport 2888 -j DNAT --to-destination 127.0.0.1:30287"
ansible dc3n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.3.11:2888"
# file: "edge-dc3n01-zk-2888.json"
ansible dc3n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n01-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc3n01-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n01-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.12 --dport 2888 -j DNAT --to-destination 127.0.0.1:30288"
ansible dc3n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.3.12:2888"
# file: "edge-dc3n02-zk-2888.json"
ansible dc3n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n02-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc3n02-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n02-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.13 --dport 2888 -j DNAT --to-destination 127.0.0.1:30289"
ansible dc3n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.3.13:2888"
# file: "edge-dc3n03-zk-2888.json"
ansible dc3n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n03-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc3n03-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n03-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.11 --dport 2888 -j DNAT --to-destination 127.0.0.1:30290"
ansible dc4n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.4.11:2888"
# file: "edge-dc4n01-zk-2888.json"
ansible dc4n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n01-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc4n01-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n01-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.12 --dport 2888 -j DNAT --to-destination 127.0.0.1:30291"
ansible dc4n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.4.12:2888"
# file: "edge-dc4n02-zk-2888.json"
ansible dc4n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n02-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc4n02-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n02-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.13 --dport 2888 -j DNAT --to-destination 127.0.0.1:30292"
ansible dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.100.4.13:2888"
# file: "edge-dc4n03-zk-2888.json"
ansible dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n03-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc4n03-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n03-zk-2888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2888 &> /opt/hashicorp/consul/logs/edge-zk-2888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2888.pid'
#


#
## configuration for edge-zk-3888
#
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.11 --dport 3888 -j DNAT --to-destination 127.0.0.1:30381"
ansible dc1n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.1.11:3888"
# file: "edge-dc1n01-zk-3888.json"
ansible dc1n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n01-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n01-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n01-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.12 --dport 3888 -j DNAT --to-destination 127.0.0.1:30382"
ansible dc1n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.1.12:3888"
# file: "edge-dc1n02-zk-3888.json"
ansible dc1n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n02-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n02-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n02-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.13 --dport 3888 -j DNAT --to-destination 127.0.0.1:30383"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.1.13:3888"
# file: "edge-dc1n03-zk-3888.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n03-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.11 --dport 3888 -j DNAT --to-destination 127.0.0.1:30384"
ansible dc2n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.2.11:3888"
# file: "edge-dc2n01-zk-3888.json"
ansible dc2n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n01-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n01-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n01-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.12 --dport 3888 -j DNAT --to-destination 127.0.0.1:30385"
ansible dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.2.12:3888"
# file: "edge-dc2n02-zk-3888.json"
ansible dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n02-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n02-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n02-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.13 --dport 3888 -j DNAT --to-destination 127.0.0.1:30386"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.2.13:3888"
# file: "edge-dc2n03-zk-3888.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n03-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.11 --dport 3888 -j DNAT --to-destination 127.0.0.1:30387"
ansible dc3n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.3.11:3888"
# file: "edge-dc3n01-zk-3888.json"
ansible dc3n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n01-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc3n01-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n01-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.12 --dport 3888 -j DNAT --to-destination 127.0.0.1:30388"
ansible dc3n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.3.12:3888"
# file: "edge-dc3n02-zk-3888.json"
ansible dc3n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n02-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc3n02-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n02-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.13 --dport 3888 -j DNAT --to-destination 127.0.0.1:30389"
ansible dc3n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.3.13:3888"
# file: "edge-dc3n03-zk-3888.json"
ansible dc3n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n03-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc3n03-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n03-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.11 --dport 3888 -j DNAT --to-destination 127.0.0.1:30390"
ansible dc4n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.4.11:3888"
# file: "edge-dc4n01-zk-3888.json"
ansible dc4n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n01-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc4n01-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n01-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.12 --dport 3888 -j DNAT --to-destination 127.0.0.1:30391"
ansible dc4n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.4.12:3888"
# file: "edge-dc4n02-zk-3888.json"
ansible dc4n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n02-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc4n02-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n02-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.13 --dport 3888 -j DNAT --to-destination 127.0.0.1:30392"
ansible dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.100.4.13:3888"
# file: "edge-dc4n03-zk-3888.json"
ansible dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n03-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc4n03-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n03-zk-3888.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-3888 &> /opt/hashicorp/consul/logs/edge-zk-3888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-3888.pid'
#


#
## configuration for edge-cs-7000
#
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.11 --dport 7000 -j DNAT --to-destination 127.0.0.1:30701"
ansible dc1n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.1.11:7000"
# file: "edge-dc1n01-cs-7000.json"
ansible dc1n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n01-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n01-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n01-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.12 --dport 7000 -j DNAT --to-destination 127.0.0.1:30702"
ansible dc1n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.1.12:7000"
# file: "edge-dc1n02-cs-7000.json"
ansible dc1n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n02-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n02-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n02-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.13 --dport 7000 -j DNAT --to-destination 127.0.0.1:30703"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.1.13:7000"
# file: "edge-dc1n03-cs-7000.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n03-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.11 --dport 7000 -j DNAT --to-destination 127.0.0.1:30704"
ansible dc2n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.2.11:7000"
# file: "edge-dc2n01-cs-7000.json"
ansible dc2n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n01-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n01-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n01-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.12 --dport 7000 -j DNAT --to-destination 127.0.0.1:30705"
ansible dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.2.12:7000"
# file: "edge-dc2n02-cs-7000.json"
ansible dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n02-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n02-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n02-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.13 --dport 7000 -j DNAT --to-destination 127.0.0.1:30706"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.2.13:7000"
# file: "edge-dc2n03-cs-7000.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n03-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.11 --dport 7000 -j DNAT --to-destination 127.0.0.1:30707"
ansible dc3n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.3.11:7000"
# file: "edge-dc3n01-cs-7000.json"
ansible dc3n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n01-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc3n01-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n01-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.12 --dport 7000 -j DNAT --to-destination 127.0.0.1:30708"
ansible dc3n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.3.12:7000"
# file: "edge-dc3n02-cs-7000.json"
ansible dc3n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n02-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc3n02-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n02-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.13 --dport 7000 -j DNAT --to-destination 127.0.0.1:30709"
ansible dc3n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.3.13:7000"
# file: "edge-dc3n03-cs-7000.json"
ansible dc3n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n03-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc3n03-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n03-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.11 --dport 7000 -j DNAT --to-destination 127.0.0.1:30710"
ansible dc4n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.4.11:7000"
# file: "edge-dc4n01-cs-7000.json"
ansible dc4n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n01-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc4n01-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n01-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.12 --dport 7000 -j DNAT --to-destination 127.0.0.1:30711"
ansible dc4n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.4.12:7000"
# file: "edge-dc4n02-cs-7000.json"
ansible dc4n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n02-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc4n02-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n02-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.13 --dport 7000 -j DNAT --to-destination 127.0.0.1:30712"
ansible dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.100.4.13:7000"
# file: "edge-dc4n03-cs-7000.json"
ansible dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n03-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc4n03-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n03-cs-7000.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-7000 &> /opt/hashicorp/consul/logs/edge-cs-7000.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-7000.pid'
#


#
## configuration for edge-cs-9042
#
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.11 --dport 9042 -j DNAT --to-destination 127.0.0.1:30521"
ansible dc1n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.1.11:9042"
# file: "edge-dc1n01-cs-9042.json"
ansible dc1n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n01-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n01-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n01-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.12 --dport 9042 -j DNAT --to-destination 127.0.0.1:30522"
ansible dc1n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.1.12:9042"
# file: "edge-dc1n02-cs-9042.json"
ansible dc1n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n02-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n02-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n02-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.13 --dport 9042 -j DNAT --to-destination 127.0.0.1:30523"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.1.13:9042"
# file: "edge-dc1n03-cs-9042.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n03-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.11 --dport 9042 -j DNAT --to-destination 127.0.0.1:30524"
ansible dc2n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.2.11:9042"
# file: "edge-dc2n01-cs-9042.json"
ansible dc2n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n01-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n01-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n01-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.12 --dport 9042 -j DNAT --to-destination 127.0.0.1:30525"
ansible dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.2.12:9042"
# file: "edge-dc2n02-cs-9042.json"
ansible dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n02-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n02-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n02-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.13 --dport 9042 -j DNAT --to-destination 127.0.0.1:30526"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.2.13:9042"
# file: "edge-dc2n03-cs-9042.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n03-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.11 --dport 9042 -j DNAT --to-destination 127.0.0.1:30527"
ansible dc3n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.3.11:9042"
# file: "edge-dc3n01-cs-9042.json"
ansible dc3n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n01-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc3n01-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n01-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.12 --dport 9042 -j DNAT --to-destination 127.0.0.1:30528"
ansible dc3n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.3.12:9042"
# file: "edge-dc3n02-cs-9042.json"
ansible dc3n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n02-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc3n02-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n02-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.13 --dport 9042 -j DNAT --to-destination 127.0.0.1:30529"
ansible dc3n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.3.13:9042"
# file: "edge-dc3n03-cs-9042.json"
ansible dc3n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n03-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc3n03-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n03-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.11 --dport 9042 -j DNAT --to-destination 127.0.0.1:30530"
ansible dc4n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.4.11:9042"
# file: "edge-dc4n01-cs-9042.json"
ansible dc4n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n01-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc4n01-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n01-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.12 --dport 9042 -j DNAT --to-destination 127.0.0.1:30531"
ansible dc4n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.4.12:9042"
# file: "edge-dc4n02-cs-9042.json"
ansible dc4n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n02-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc4n02-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n02-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.13 --dport 9042 -j DNAT --to-destination 127.0.0.1:30532"
ansible dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.100.4.13:9042"
# file: "edge-dc4n03-cs-9042.json"
ansible dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n03-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc4n03-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n03-cs-9042.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9042 &> /opt/hashicorp/consul/logs/edge-cs-9042.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9042.pid'
#


#
## configuration for edge-cs-9160
#
ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.11 --dport 9160 -j DNAT --to-destination 127.0.0.1:30601"
ansible dc1n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.1.11:9160"
# file: "edge-dc1n01-cs-9160.json"
ansible dc1n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n01-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n01-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n01-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.12 --dport 9160 -j DNAT --to-destination 127.0.0.1:30602"
ansible dc1n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.1.12:9160"
# file: "edge-dc1n02-cs-9160.json"
ansible dc1n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n02-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n02-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n02-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.1.13 --dport 9160 -j DNAT --to-destination 127.0.0.1:30603"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.1.13:9160"
# file: "edge-dc1n03-cs-9160.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n03-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.11 --dport 9160 -j DNAT --to-destination 127.0.0.1:30604"
ansible dc2n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.2.11:9160"
# file: "edge-dc2n01-cs-9160.json"
ansible dc2n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n01-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n01-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n01-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.12 --dport 9160 -j DNAT --to-destination 127.0.0.1:30605"
ansible dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.2.12:9160"
# file: "edge-dc2n02-cs-9160.json"
ansible dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n02-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n02-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n02-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.2.13 --dport 9160 -j DNAT --to-destination 127.0.0.1:30606"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.2.13:9160"
# file: "edge-dc2n03-cs-9160.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n03-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.11 --dport 9160 -j DNAT --to-destination 127.0.0.1:30607"
ansible dc3n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.3.11:9160"
# file: "edge-dc3n01-cs-9160.json"
ansible dc3n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n01-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc3n01-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n01-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.12 --dport 9160 -j DNAT --to-destination 127.0.0.1:30608"
ansible dc3n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.3.12:9160"
# file: "edge-dc3n02-cs-9160.json"
ansible dc3n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n02-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc3n02-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n02-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.3.13 --dport 9160 -j DNAT --to-destination 127.0.0.1:30609"
ansible dc3n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.3.13:9160"
# file: "edge-dc3n03-cs-9160.json"
ansible dc3n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc3n03-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc3n03-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc3n03-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.11 --dport 9160 -j DNAT --to-destination 127.0.0.1:30610"
ansible dc4n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.4.11:9160"
# file: "edge-dc4n01-cs-9160.json"
ansible dc4n01 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n01-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc4n01-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n01-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.12 --dport 9160 -j DNAT --to-destination 127.0.0.1:30611"
ansible dc4n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.4.12:9160"
# file: "edge-dc4n02-cs-9160.json"
ansible dc4n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n02-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc4n02-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n02-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.100.4.13 --dport 9160 -j DNAT --to-destination 127.0.0.1:30612"
ansible dc4n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.100.4.13:9160"
# file: "edge-dc4n03-cs-9160.json"
ansible dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc4n03-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc4n03-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc4n03-cs-9160.pid'

ansible dc1n01,dc1n02,dc1n03,dc2n01,dc2n02,dc2n03,dc3n01,dc3n02,dc3n03,dc4n01,dc4n02,dc4n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9160 &> /opt/hashicorp/consul/logs/edge-cs-9160.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9160.pid'
#


#
## configuration for edge-mp-4529
#
ansible  --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-4529 &> /opt/hashicorp/consul/logs/edge-mp-4529.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-4529.pid'
#


#
## configuration for edge-mp-8998
#
ansible  --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-8998 &> /opt/hashicorp/consul/logs/edge-mp-8998.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-8998.pid'
#


#
## configuration for edge-ms-8080
#
ansible  --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-ms-8080 &> /opt/hashicorp/consul/logs/edge-ms-8080.log & echo $! > /opt/hashicorp/consul/logs/edge-ms-8080.pid'
#


