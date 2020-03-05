#
## reset CONSUL_ custom chains
#
set +e
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t filter -F CONSUL_INPUT"
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t filter -X CONSUL_INPUT"
set -e
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t filter -N CONSUL_INPUT"
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t filter -A INPUT -p tcp -j CONSUL_INPUT"

set +e
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t nat -F CONSUL_OUTPUT"
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t nat -X CONSUL_OUTPUT"
set -e
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t nat -N CONSUL_OUTPUT"
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t nat -A OUTPUT -p tcp -j CONSUL_OUTPUT"
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --uid-owner consul -j RETURN"
ansible n01,n13,n02,n03,n04,n09,n14,n07,n08,n05,n06,n10,n15,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --gid-owner consul -j RETURN"

#
## node traffic control
#

ansible n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n09 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 8080 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n09 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,9443,1099,8443 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n14 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 8080 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n14 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,9443,1099,8443 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n08 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n08 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n10 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n11 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n12 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

#


#
## client nodes sidecars
#
#
## configuration for edge-zk-2181
#
ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.11 --dport 2181 -j DNAT --to-destination 127.0.0.1:30212"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.132.11:2181"
# file: "edge-n02-zk-2181.json"
ansible n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n02-zk-2181  &> /opt/hashicorp/consul/logs/edge-n02-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-zk-2181.pid'

ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.12 --dport 2181 -j DNAT --to-destination 127.0.0.1:30213"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.132.12:2181"
# file: "edge-n03-zk-2181.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-zk-2181  &> /opt/hashicorp/consul/logs/edge-n03-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-zk-2181.pid'

ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.13 --dport 2181 -j DNAT --to-destination 127.0.0.1:30214"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.132.13:2181"
# file: "edge-n04-zk-2181.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-zk-2181  &> /opt/hashicorp/consul/logs/edge-n04-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-zk-2181.pid'

ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2181 &> /opt/hashicorp/consul/logs/edge-zk-2181.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2181.pid'
#


#
## configuration for edge-zk-2888
#
ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.11 --dport 2888 -j DNAT --to-destination 127.0.0.1:30281"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.132.11:2888"
# file: "edge-n02-zk-2888.json"
ansible n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n02-zk-2888  &> /opt/hashicorp/consul/logs/edge-n02-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-zk-2888.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.12 --dport 2888 -j DNAT --to-destination 127.0.0.1:30282"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.132.12:2888"
# file: "edge-n03-zk-2888.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-zk-2888  &> /opt/hashicorp/consul/logs/edge-n03-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-zk-2888.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.13 --dport 2888 -j DNAT --to-destination 127.0.0.1:30283"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.132.13:2888"
# file: "edge-n04-zk-2888.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-zk-2888  &> /opt/hashicorp/consul/logs/edge-n04-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-zk-2888.pid'

ansible n02,n03,n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2888 &> /opt/hashicorp/consul/logs/edge-zk-2888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2888.pid'
#


#
## configuration for edge-zk-3888
#
ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.11 --dport 3888 -j DNAT --to-destination 127.0.0.1:30381"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.132.11:3888"
# file: "edge-n02-zk-3888.json"
ansible n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n02-zk-3888  &> /opt/hashicorp/consul/logs/edge-n02-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-zk-3888.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.12 --dport 3888 -j DNAT --to-destination 127.0.0.1:30382"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.132.12:3888"
# file: "edge-n03-zk-3888.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-zk-3888  &> /opt/hashicorp/consul/logs/edge-n03-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-zk-3888.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.13 --dport 3888 -j DNAT --to-destination 127.0.0.1:30383"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.132.13:3888"
# file: "edge-n04-zk-3888.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-zk-3888  &> /opt/hashicorp/consul/logs/edge-n04-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-zk-3888.pid'

ansible n02,n03,n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-3888 &> /opt/hashicorp/consul/logs/edge-zk-3888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-3888.pid'
#


#
## configuration for edge-cs-7000
#
ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.11 --dport 7000 -j DNAT --to-destination 127.0.0.1:30701"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.132.11:7000"
# file: "edge-n02-cs-7000.json"
ansible n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n02-cs-7000  &> /opt/hashicorp/consul/logs/edge-n02-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-cs-7000.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.12 --dport 7000 -j DNAT --to-destination 127.0.0.1:30702"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.132.12:7000"
# file: "edge-n03-cs-7000.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-cs-7000  &> /opt/hashicorp/consul/logs/edge-n03-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-cs-7000.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.13 --dport 7000 -j DNAT --to-destination 127.0.0.1:30703"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.132.13:7000"
# file: "edge-n04-cs-7000.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-cs-7000  &> /opt/hashicorp/consul/logs/edge-n04-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-cs-7000.pid'

ansible n02,n03,n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-7000 &> /opt/hashicorp/consul/logs/edge-cs-7000.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-7000.pid'
#


#
## configuration for edge-cs-9042
#
ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.11 --dport 9042 -j DNAT --to-destination 127.0.0.1:30521"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.132.11:9042"
# file: "edge-n02-cs-9042.json"
ansible n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n02-cs-9042  &> /opt/hashicorp/consul/logs/edge-n02-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-cs-9042.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.12 --dport 9042 -j DNAT --to-destination 127.0.0.1:30522"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.132.12:9042"
# file: "edge-n03-cs-9042.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-cs-9042  &> /opt/hashicorp/consul/logs/edge-n03-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-cs-9042.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.13 --dport 9042 -j DNAT --to-destination 127.0.0.1:30523"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.132.13:9042"
# file: "edge-n04-cs-9042.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-cs-9042  &> /opt/hashicorp/consul/logs/edge-n04-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-cs-9042.pid'

ansible n02,n03,n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9042 &> /opt/hashicorp/consul/logs/edge-cs-9042.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9042.pid'
#


#
## configuration for edge-cs-9160
#
ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.11 --dport 9160 -j DNAT --to-destination 127.0.0.1:30601"
ansible n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.132.11:9160"
# file: "edge-n02-cs-9160.json"
ansible n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n02-cs-9160  &> /opt/hashicorp/consul/logs/edge-n02-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n02-cs-9160.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.12 --dport 9160 -j DNAT --to-destination 127.0.0.1:30602"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.132.12:9160"
# file: "edge-n03-cs-9160.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-cs-9160  &> /opt/hashicorp/consul/logs/edge-n03-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-cs-9160.pid'

ansible n02,n03,n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.132.13 --dport 9160 -j DNAT --to-destination 127.0.0.1:30603"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.132.13:9160"
# file: "edge-n04-cs-9160.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-cs-9160  &> /opt/hashicorp/consul/logs/edge-n04-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-cs-9160.pid'

ansible n02,n03,n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9160 &> /opt/hashicorp/consul/logs/edge-cs-9160.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9160.pid'
#


#
## configuration for edge-mp-4529
#
ansible n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.13 --dport 4529 -j DNAT --to-destination 127.0.0.1:30903"
ansible n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.133.13:4529"
# file: "edge-n07-mp-4529.json"
ansible n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n07-mp-4529  &> /opt/hashicorp/consul/logs/edge-n07-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n07-mp-4529.pid'

ansible n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.14 --dport 4529 -j DNAT --to-destination 127.0.0.1:30904"
ansible n08 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.133.14:4529"
# file: "edge-n08-mp-4529.json"
ansible n08 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n08-mp-4529  &> /opt/hashicorp/consul/logs/edge-n08-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n08-mp-4529.pid'

ansible n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.11 --dport 4529 -j DNAT --to-destination 127.0.0.1:30901"
ansible n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.133.11:4529"
# file: "edge-n05-mp-4529.json"
ansible n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n05-mp-4529  &> /opt/hashicorp/consul/logs/edge-n05-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n05-mp-4529.pid'

ansible n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.12 --dport 4529 -j DNAT --to-destination 127.0.0.1:30902"
ansible n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.133.12:4529"
# file: "edge-n06-mp-4529.json"
ansible n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n06-mp-4529  &> /opt/hashicorp/consul/logs/edge-n06-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n06-mp-4529.pid'

ansible n07,n08,n05,n06,n11,n12 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-4529 &> /opt/hashicorp/consul/logs/edge-mp-4529.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-4529.pid'
#


#
## configuration for edge-mp-8998
#
ansible n07,n08,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.13 --dport 8998 -j DNAT --to-destination 127.0.0.1:30853"
ansible n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.133.13:8998"
# file: "edge-n07-mp-8998.json"
ansible n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n07-mp-8998  &> /opt/hashicorp/consul/logs/edge-n07-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n07-mp-8998.pid'

ansible n07,n08,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.14 --dport 8998 -j DNAT --to-destination 127.0.0.1:30854"
ansible n08 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.133.14:8998"
# file: "edge-n08-mp-8998.json"
ansible n08 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n08-mp-8998  &> /opt/hashicorp/consul/logs/edge-n08-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n08-mp-8998.pid'

ansible n07,n08,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.11 --dport 8998 -j DNAT --to-destination 127.0.0.1:30851"
ansible n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.133.11:8998"
# file: "edge-n05-mp-8998.json"
ansible n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n05-mp-8998  &> /opt/hashicorp/consul/logs/edge-n05-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n05-mp-8998.pid'

ansible n07,n08,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.12 --dport 8998 -j DNAT --to-destination 127.0.0.1:30852"
ansible n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.133.12:8998"
# file: "edge-n06-mp-8998.json"
ansible n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n06-mp-8998  &> /opt/hashicorp/consul/logs/edge-n06-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n06-mp-8998.pid'

ansible n07,n08,n11,n12 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-8998 &> /opt/hashicorp/consul/logs/edge-mp-8998.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-8998.pid'
#


#
## configuration for edge-ms-8080
#
ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.15 --dport 8080 -j DNAT --to-destination 127.0.0.1:30806"
ansible n09 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j DNAT --to-destination 10.119.133.15:8080"
# file: "edge-n09-ms-8080.json"
ansible n09 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n09-ms-8080  &> /opt/hashicorp/consul/logs/edge-n09-ms-8080.log &  echo $! > /opt/hashicorp/consul/logs/edge-n09-ms-8080.pid'

ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.133.16 --dport 8080 -j DNAT --to-destination 127.0.0.1:30810"
ansible n14 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j DNAT --to-destination 10.119.133.16:8080"
# file: "edge-n14-ms-8080.json"
ansible n14 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n14-ms-8080  &> /opt/hashicorp/consul/logs/edge-n14-ms-8080.log &  echo $! > /opt/hashicorp/consul/logs/edge-n14-ms-8080.pid'

ansible n01,n13,n09,n14,n07,n08,n05,n06,n11,n12 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-ms-8080 &> /opt/hashicorp/consul/logs/edge-ms-8080.log & echo $! > /opt/hashicorp/consul/logs/edge-ms-8080.pid'
#


