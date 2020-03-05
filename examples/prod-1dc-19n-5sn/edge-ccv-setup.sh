#
## reset CONSUL_ custom chains
#
set +e
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t filter -F CONSUL_INPUT"
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t filter -X CONSUL_INPUT"
set -e
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t filter -N CONSUL_INPUT"
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t filter -A INPUT -p tcp -j CONSUL_INPUT"

set +e
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t nat -F CONSUL_OUTPUT"
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t nat -X CONSUL_OUTPUT"
set -e
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t nat -N CONSUL_OUTPUT"
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t nat -A OUTPUT -p tcp -j CONSUL_OUTPUT"
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --uid-owner consul -j RETURN"
ansible n01,n02,n08,n09,n03,n04,n05,n06,n07,n10,n11,n12,n13,n15,n16,n17,n18,n19,n29 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --gid-owner consul -j RETURN"

#
## node traffic control
#

ansible n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n08 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n09 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998,8080 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,1099,8443,9443 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n10 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n11 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n12 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n16 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n16 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n17 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n17 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n18 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible n18 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n19 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible n29 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

#


#
## client nodes sidecars
#
#
## configuration for edge-zk-2181
#
ansible n01,n02,n03,n04,n05,n06,n07,n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 2181 -j DNAT --to-destination 127.0.0.1:30218"
ansible n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.213:2181"
# file: "edge-n13-zk-2181.json"
ansible n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n13-zk-2181  &> /opt/hashicorp/consul/logs/edge-n13-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n13-zk-2181.pid'

ansible n01,n02,n03,n04,n05,n06,n07,n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 2181 -j DNAT --to-destination 127.0.0.1:30219"
ansible n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.215:2181"
# file: "edge-n15-zk-2181.json"
ansible n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n15-zk-2181  &> /opt/hashicorp/consul/logs/edge-n15-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n15-zk-2181.pid'

ansible n01,n02,n03,n04,n05,n06,n07,n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 2181 -j DNAT --to-destination 127.0.0.1:30220"
ansible n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.216:2181"
# file: "edge-n16-zk-2181.json"
ansible n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n16-zk-2181  &> /opt/hashicorp/consul/logs/edge-n16-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n16-zk-2181.pid'

ansible n01,n02,n03,n04,n05,n06,n07,n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 2181 -j DNAT --to-destination 127.0.0.1:30221"
ansible n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.217:2181"
# file: "edge-n17-zk-2181.json"
ansible n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n17-zk-2181  &> /opt/hashicorp/consul/logs/edge-n17-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n17-zk-2181.pid'

ansible n01,n02,n03,n04,n05,n06,n07,n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 2181 -j DNAT --to-destination 127.0.0.1:30222"
ansible n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.218:2181"
# file: "edge-n18-zk-2181.json"
ansible n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n18-zk-2181  &> /opt/hashicorp/consul/logs/edge-n18-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-n18-zk-2181.pid'

ansible n01,n02,n03,n04,n05,n06,n07,n19 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2181 &> /opt/hashicorp/consul/logs/edge-zk-2181.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2181.pid'
#


#
## configuration for edge-zk-2888
#
ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 2888 -j DNAT --to-destination 127.0.0.1:30281"
ansible n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.213:2888"
# file: "edge-n13-zk-2888.json"
ansible n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n13-zk-2888  &> /opt/hashicorp/consul/logs/edge-n13-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n13-zk-2888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 2888 -j DNAT --to-destination 127.0.0.1:30282"
ansible n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.215:2888"
# file: "edge-n15-zk-2888.json"
ansible n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n15-zk-2888  &> /opt/hashicorp/consul/logs/edge-n15-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n15-zk-2888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 2888 -j DNAT --to-destination 127.0.0.1:30283"
ansible n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.216:2888"
# file: "edge-n16-zk-2888.json"
ansible n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n16-zk-2888  &> /opt/hashicorp/consul/logs/edge-n16-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n16-zk-2888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 2888 -j DNAT --to-destination 127.0.0.1:30284"
ansible n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.217:2888"
# file: "edge-n17-zk-2888.json"
ansible n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n17-zk-2888  &> /opt/hashicorp/consul/logs/edge-n17-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n17-zk-2888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 2888 -j DNAT --to-destination 127.0.0.1:30285"
ansible n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.218:2888"
# file: "edge-n18-zk-2888.json"
ansible n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n18-zk-2888  &> /opt/hashicorp/consul/logs/edge-n18-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n18-zk-2888.pid'

ansible n13,n15,n16,n17,n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2888 &> /opt/hashicorp/consul/logs/edge-zk-2888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2888.pid'
#


#
## configuration for edge-zk-3888
#
ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 3888 -j DNAT --to-destination 127.0.0.1:30381"
ansible n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.213:3888"
# file: "edge-n13-zk-3888.json"
ansible n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n13-zk-3888  &> /opt/hashicorp/consul/logs/edge-n13-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n13-zk-3888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 3888 -j DNAT --to-destination 127.0.0.1:30382"
ansible n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.215:3888"
# file: "edge-n15-zk-3888.json"
ansible n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n15-zk-3888  &> /opt/hashicorp/consul/logs/edge-n15-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n15-zk-3888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 3888 -j DNAT --to-destination 127.0.0.1:30383"
ansible n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.216:3888"
# file: "edge-n16-zk-3888.json"
ansible n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n16-zk-3888  &> /opt/hashicorp/consul/logs/edge-n16-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n16-zk-3888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 3888 -j DNAT --to-destination 127.0.0.1:30384"
ansible n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.217:3888"
# file: "edge-n17-zk-3888.json"
ansible n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n17-zk-3888  &> /opt/hashicorp/consul/logs/edge-n17-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n17-zk-3888.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 3888 -j DNAT --to-destination 127.0.0.1:30385"
ansible n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.218:3888"
# file: "edge-n18-zk-3888.json"
ansible n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n18-zk-3888  &> /opt/hashicorp/consul/logs/edge-n18-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-n18-zk-3888.pid'

ansible n13,n15,n16,n17,n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-3888 &> /opt/hashicorp/consul/logs/edge-zk-3888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-3888.pid'
#


#
## configuration for edge-cs-7000
#
ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 7000 -j DNAT --to-destination 127.0.0.1:30701"
ansible n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.213:7000"
# file: "edge-n13-cs-7000.json"
ansible n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n13-cs-7000  &> /opt/hashicorp/consul/logs/edge-n13-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n13-cs-7000.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 7000 -j DNAT --to-destination 127.0.0.1:30702"
ansible n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.215:7000"
# file: "edge-n15-cs-7000.json"
ansible n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n15-cs-7000  &> /opt/hashicorp/consul/logs/edge-n15-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n15-cs-7000.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 7000 -j DNAT --to-destination 127.0.0.1:30703"
ansible n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.216:7000"
# file: "edge-n16-cs-7000.json"
ansible n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n16-cs-7000  &> /opt/hashicorp/consul/logs/edge-n16-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n16-cs-7000.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 7000 -j DNAT --to-destination 127.0.0.1:30704"
ansible n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.217:7000"
# file: "edge-n17-cs-7000.json"
ansible n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n17-cs-7000  &> /opt/hashicorp/consul/logs/edge-n17-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n17-cs-7000.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 7000 -j DNAT --to-destination 127.0.0.1:30705"
ansible n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.218:7000"
# file: "edge-n18-cs-7000.json"
ansible n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n18-cs-7000  &> /opt/hashicorp/consul/logs/edge-n18-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-n18-cs-7000.pid'

ansible n13,n15,n16,n17,n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-7000 &> /opt/hashicorp/consul/logs/edge-cs-7000.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-7000.pid'
#


#
## configuration for edge-cs-9042
#
ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 9042 -j DNAT --to-destination 127.0.0.1:30521"
ansible n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.213:9042"
# file: "edge-n13-cs-9042.json"
ansible n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n13-cs-9042  &> /opt/hashicorp/consul/logs/edge-n13-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n13-cs-9042.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 9042 -j DNAT --to-destination 127.0.0.1:30522"
ansible n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.215:9042"
# file: "edge-n15-cs-9042.json"
ansible n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n15-cs-9042  &> /opt/hashicorp/consul/logs/edge-n15-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n15-cs-9042.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 9042 -j DNAT --to-destination 127.0.0.1:30523"
ansible n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.216:9042"
# file: "edge-n16-cs-9042.json"
ansible n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n16-cs-9042  &> /opt/hashicorp/consul/logs/edge-n16-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n16-cs-9042.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 9042 -j DNAT --to-destination 127.0.0.1:30524"
ansible n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.217:9042"
# file: "edge-n17-cs-9042.json"
ansible n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n17-cs-9042  &> /opt/hashicorp/consul/logs/edge-n17-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n17-cs-9042.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 9042 -j DNAT --to-destination 127.0.0.1:30525"
ansible n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.218:9042"
# file: "edge-n18-cs-9042.json"
ansible n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n18-cs-9042  &> /opt/hashicorp/consul/logs/edge-n18-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-n18-cs-9042.pid'

ansible n13,n15,n16,n17,n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9042 &> /opt/hashicorp/consul/logs/edge-cs-9042.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9042.pid'
#


#
## configuration for edge-cs-9160
#
ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 9160 -j DNAT --to-destination 127.0.0.1:30601"
ansible n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.213:9160"
# file: "edge-n13-cs-9160.json"
ansible n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n13-cs-9160  &> /opt/hashicorp/consul/logs/edge-n13-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n13-cs-9160.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 9160 -j DNAT --to-destination 127.0.0.1:30602"
ansible n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.215:9160"
# file: "edge-n15-cs-9160.json"
ansible n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n15-cs-9160  &> /opt/hashicorp/consul/logs/edge-n15-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n15-cs-9160.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 9160 -j DNAT --to-destination 127.0.0.1:30603"
ansible n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.216:9160"
# file: "edge-n16-cs-9160.json"
ansible n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n16-cs-9160  &> /opt/hashicorp/consul/logs/edge-n16-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n16-cs-9160.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 9160 -j DNAT --to-destination 127.0.0.1:30604"
ansible n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.217:9160"
# file: "edge-n17-cs-9160.json"
ansible n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n17-cs-9160  &> /opt/hashicorp/consul/logs/edge-n17-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n17-cs-9160.pid'

ansible n13,n15,n16,n17,n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 9160 -j DNAT --to-destination 127.0.0.1:30605"
ansible n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.218:9160"
# file: "edge-n18-cs-9160.json"
ansible n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n18-cs-9160  &> /opt/hashicorp/consul/logs/edge-n18-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-n18-cs-9160.pid'

ansible n13,n15,n16,n17,n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9160 &> /opt/hashicorp/consul/logs/edge-cs-9160.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9160.pid'
#


#
## configuration for edge-mp-4529
#
ansible n01,n02,n03,n04,n05,n06,n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.203 --dport 4529 -j DNAT --to-destination 127.0.0.1:30903"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.203:4529"
# file: "edge-n03-mp-4529.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-mp-4529  &> /opt/hashicorp/consul/logs/edge-n03-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-mp-4529.pid'

ansible n01,n02,n03,n04,n05,n06,n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.204 --dport 4529 -j DNAT --to-destination 127.0.0.1:30904"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.204:4529"
# file: "edge-n04-mp-4529.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-mp-4529  &> /opt/hashicorp/consul/logs/edge-n04-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-mp-4529.pid'

ansible n01,n02,n03,n04,n05,n06,n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.205 --dport 4529 -j DNAT --to-destination 127.0.0.1:30905"
ansible n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.205:4529"
# file: "edge-n05-mp-4529.json"
ansible n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n05-mp-4529  &> /opt/hashicorp/consul/logs/edge-n05-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n05-mp-4529.pid'

ansible n01,n02,n03,n04,n05,n06,n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.206 --dport 4529 -j DNAT --to-destination 127.0.0.1:30906"
ansible n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.206:4529"
# file: "edge-n06-mp-4529.json"
ansible n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n06-mp-4529  &> /opt/hashicorp/consul/logs/edge-n06-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n06-mp-4529.pid'

ansible n01,n02,n03,n04,n05,n06,n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.207 --dport 4529 -j DNAT --to-destination 127.0.0.1:30907"
ansible n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.207:4529"
# file: "edge-n07-mp-4529.json"
ansible n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n07-mp-4529  &> /opt/hashicorp/consul/logs/edge-n07-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-n07-mp-4529.pid'

ansible n01,n02,n03,n04,n05,n06,n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-4529 &> /opt/hashicorp/consul/logs/edge-mp-4529.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-4529.pid'
#


#
## configuration for edge-mp-8998
#
ansible n01,n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.203 --dport 8998 -j DNAT --to-destination 127.0.0.1:30853"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.203:8998"
# file: "edge-n03-mp-8998.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-mp-8998  &> /opt/hashicorp/consul/logs/edge-n03-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-mp-8998.pid'

ansible n01,n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.204 --dport 8998 -j DNAT --to-destination 127.0.0.1:30854"
ansible n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.204:8998"
# file: "edge-n04-mp-8998.json"
ansible n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n04-mp-8998  &> /opt/hashicorp/consul/logs/edge-n04-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n04-mp-8998.pid'

ansible n01,n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.205 --dport 8998 -j DNAT --to-destination 127.0.0.1:30855"
ansible n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.205:8998"
# file: "edge-n05-mp-8998.json"
ansible n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n05-mp-8998  &> /opt/hashicorp/consul/logs/edge-n05-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n05-mp-8998.pid'

ansible n01,n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.206 --dport 8998 -j DNAT --to-destination 127.0.0.1:30856"
ansible n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.206:8998"
# file: "edge-n06-mp-8998.json"
ansible n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n06-mp-8998  &> /opt/hashicorp/consul/logs/edge-n06-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n06-mp-8998.pid'

ansible n01,n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.207 --dport 8998 -j DNAT --to-destination 127.0.0.1:30857"
ansible n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.207:8998"
# file: "edge-n07-mp-8998.json"
ansible n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n07-mp-8998  &> /opt/hashicorp/consul/logs/edge-n07-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-n07-mp-8998.pid'

ansible n01,n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-8998 &> /opt/hashicorp/consul/logs/edge-mp-8998.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-8998.pid'
#


#
## configuration for edge-ms-8080
#
ansible n01,n02,n03,n04,n05,n06,n07,n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.203 --dport 8080 -j DNAT --to-destination 127.0.0.1:30803"
ansible n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j DNAT --to-destination 10.119.3.203:8080"
# file: "edge-n03-ms-8080.json"
ansible n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-n03-ms-8080  &> /opt/hashicorp/consul/logs/edge-n03-ms-8080.log &  echo $! > /opt/hashicorp/consul/logs/edge-n03-ms-8080.pid'

ansible n01,n02,n03,n04,n05,n06,n07,n19 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-ms-8080 &> /opt/hashicorp/consul/logs/edge-ms-8080.log & echo $! > /opt/hashicorp/consul/logs/edge-ms-8080.pid'
#


