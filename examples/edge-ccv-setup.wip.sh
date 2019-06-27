#
## reset CONSUL_ custom chains
#
set +x
ansible n01,n02,n03,n04,n05 -ba "iptables -t filter -F CONSUL_INPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t filter -X CONSUL_INPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t filter -N CONSUL_INPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t filter -A INPUT -p tcp -j CONSUL_INPUT"

set 
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -F CONSUL_OUTPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -X CONSUL_OUTPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -N CONSUL_OUTPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A OUTPUT -p tcp -j CONSUL_OUTPUT"
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --uid-owner consul -j RETURN"
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --gid-owner consul -j RETURN"

#
## node traffic control
#

ansible n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 8080,7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,9443,1099,8443 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,90002,90003,90004,90005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,90002,90003,90004,90005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports  -m state --state NEW,ESTABLISHED -j REJECT"
ansible n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports  -m state --state NEW,ESTABLISHED -j REJECT"
ansible n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"


#


#
## client nodes sidecars
#
#
## configuration for edge-zk-2181
#
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 2181 -j DNAT --to-destination 127.0.0.1:30211"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.36.11.19:2181"
# file: "edge-n01-zk-2181.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-zk-2181  &> /opt/hashicorp/consul/logs/edge-n01-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-zk-2181.pid'

ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.30 --dport 2181 -j DNAT --to-destination 127.0.0.1:30212"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.36.10.30:2181"
# file: "edge-n02-zk-2181.json"
ansible n02 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n02-zk-2181  &> /opt/hashicorp/consul/logs/edge-n02-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-zk-2181.pid'

ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.22 --dport 2181 -j DNAT --to-destination 127.0.0.1:30213"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.36.10.22:2181"
# file: "edge-n03-zk-2181.json"
ansible n03 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n03-zk-2181  &> /opt/hashicorp/consul/logs/edge-n03-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-zk-2181.pid'

ansible n01,n02,n03,n04,n05 -m shell -a 'nohup consul connect proxy -service edge-zk-2181 $upstreams  &> /opt/hashicorp/consul/logs/edge-zk-2181.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2181.pid'
#


#
## configuration for edge-zk-2888
#
ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 2888 -j DNAT --to-destination 127.0.0.1:30281"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.36.11.19:2888"
# file: "edge-n01-zk-2888.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-zk-2888  &> /opt/hashicorp/consul/logs/edge-n01-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-zk-2888.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.30 --dport 2888 -j DNAT --to-destination 127.0.0.1:30282"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.36.10.30:2888"
# file: "edge-n02-zk-2888.json"
ansible n02 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n02-zk-2888  &> /opt/hashicorp/consul/logs/edge-n02-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-zk-2888.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.22 --dport 2888 -j DNAT --to-destination 127.0.0.1:30283"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.36.10.22:2888"
# file: "edge-n03-zk-2888.json"
ansible n03 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n03-zk-2888  &> /opt/hashicorp/consul/logs/edge-n03-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-zk-2888.pid'

ansible n01,n02,n03 -m shell -a 'nohup consul connect proxy -service edge-zk-2888 $upstreams  &> /opt/hashicorp/consul/logs/edge-zk-2888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2888.pid'
#


#
## configuration for edge-zk-3888
#
ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 3888 -j DNAT --to-destination 127.0.0.1:30381"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.36.11.19:3888"
# file: "edge-n01-zk-3888.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-zk-3888  &> /opt/hashicorp/consul/logs/edge-n01-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-zk-3888.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.30 --dport 3888 -j DNAT --to-destination 127.0.0.1:30382"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.36.10.30:3888"
# file: "edge-n02-zk-3888.json"
ansible n02 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n02-zk-3888  &> /opt/hashicorp/consul/logs/edge-n02-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-zk-3888.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.22 --dport 3888 -j DNAT --to-destination 127.0.0.1:30383"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.36.10.22:3888"
# file: "edge-n03-zk-3888.json"
ansible n03 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n03-zk-3888  &> /opt/hashicorp/consul/logs/edge-n03-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-zk-3888.pid'

ansible n01,n02,n03 -m shell -a 'nohup consul connect proxy -service edge-zk-3888 $upstreams  &> /opt/hashicorp/consul/logs/edge-zk-3888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-3888.pid'
#


#
## configuration for edge-cs-7000
#
ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 7000 -j DNAT --to-destination 127.0.0.1:30701"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.36.11.19:7000"
# file: "edge-n01-cs-7000.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-cs-7000  &> /opt/hashicorp/consul/logs/edge-n01-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-cs-7000.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.30 --dport 7000 -j DNAT --to-destination 127.0.0.1:30702"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.36.10.30:7000"
# file: "edge-n02-cs-7000.json"
ansible n02 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n02-cs-7000  &> /opt/hashicorp/consul/logs/edge-n02-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-cs-7000.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.22 --dport 7000 -j DNAT --to-destination 127.0.0.1:30703"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.36.10.22:7000"
# file: "edge-n03-cs-7000.json"
ansible n03 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n03-cs-7000  &> /opt/hashicorp/consul/logs/edge-n03-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-cs-7000.pid'

ansible n01,n02,n03 -m shell -a 'nohup consul connect proxy -service edge-cs-7000 $upstreams  &> /opt/hashicorp/consul/logs/edge-cs-7000.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-7000.pid'
#


#
## configuration for edge-cs-9042
#
ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 9042 -j DNAT --to-destination 127.0.0.1:30521"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.36.11.19:9042"
# file: "edge-n01-cs-9042.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-cs-9042  &> /opt/hashicorp/consul/logs/edge-n01-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-cs-9042.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.30 --dport 9042 -j DNAT --to-destination 127.0.0.1:30522"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.36.10.30:9042"
# file: "edge-n02-cs-9042.json"
ansible n02 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n02-cs-9042  &> /opt/hashicorp/consul/logs/edge-n02-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-cs-9042.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.22 --dport 9042 -j DNAT --to-destination 127.0.0.1:30523"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.36.10.22:9042"
# file: "edge-n03-cs-9042.json"
ansible n03 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n03-cs-9042  &> /opt/hashicorp/consul/logs/edge-n03-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-cs-9042.pid'

ansible n01,n02,n03 -m shell -a 'nohup consul connect proxy -service edge-cs-9042 $upstreams  &> /opt/hashicorp/consul/logs/edge-cs-9042.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9042.pid'
#


#
## configuration for edge-cs-9160
#
ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 9160 -j DNAT --to-destination 127.0.0.1:30601"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.36.11.19:9160"
# file: "edge-n01-cs-9160.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-cs-9160  &> /opt/hashicorp/consul/logs/edge-n01-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-cs-9160.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.30 --dport 9160 -j DNAT --to-destination 127.0.0.1:30602"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.36.10.30:9160"
# file: "edge-n02-cs-9160.json"
ansible n02 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n02-cs-9160  &> /opt/hashicorp/consul/logs/edge-n02-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-cs-9160.pid'

ansible n01,n02,n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.10.22 --dport 9160 -j DNAT --to-destination 127.0.0.1:30603"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.36.10.22:9160"
# file: "edge-n03-cs-9160.json"
ansible n03 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n03-cs-9160  &> /opt/hashicorp/consul/logs/edge-n03-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-cs-9160.pid'

ansible n01,n02,n03 -m shell -a 'nohup consul connect proxy -service edge-cs-9160 $upstreams  &> /opt/hashicorp/consul/logs/edge-cs-9160.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9160.pid'
#


#
## configuration for edge-ms-8080
#
ansible n01,n02,n03,n04,n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.36.11.19 --dport 8080 -j DNAT --to-destination 127.0.0.1:30801"
ansible n01 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j DNAT --to-destination 10.36.11.19:8080"
# file: "edge-n01-ms-8080.json"
ansible n01 -m shell -a 'nohup consul connect proxy -sidecar-for edge-n01-ms-8080  &> /opt/hashicorp/consul/logs/edge-n01-ms-8080.log &  echo $! > /opt/hashicorp/consul/logs/edge-n01-ms-8080.pid'

ansible n01,n02,n03,n04,n05 -m shell -a 'nohup consul connect proxy -service edge-ms-8080 $upstreams  &> /opt/hashicorp/consul/logs/edge-ms-8080.log & echo $! > /opt/hashicorp/consul/logs/edge-ms-8080.pid'
#


