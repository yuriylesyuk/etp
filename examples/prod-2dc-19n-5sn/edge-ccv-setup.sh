#
## reset CONSUL_ custom chains
#
set +e
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t filter -F CONSUL_INPUT"
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t filter -X CONSUL_INPUT"
set -e
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t filter -N CONSUL_INPUT"
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t filter -A INPUT -p tcp -j CONSUL_INPUT"

set +e
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t nat -F CONSUL_OUTPUT"
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t nat -X CONSUL_OUTPUT"
set -e
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t nat -N CONSUL_OUTPUT"
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t nat -A OUTPUT -p tcp -j CONSUL_OUTPUT"
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --uid-owner consul -j RETURN"
ansible dc1n01,dc1n02,dc1n08,dc1n09,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n10,dc1n11,dc1n12,dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc1n19,dc1n29,dc2n01,dc2n02,dc2n08,dc2n09,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n10,dc2n11,dc2n12,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18,dc2n19,dc2n29 -ba "iptables -t nat -A CONSUL_OUTPUT -m owner --gid-owner consul -j RETURN"

#
## node traffic control
#

ansible dc1n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n08 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n09 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998,8080 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,1099,8443,9443 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n10 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n11 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n12 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n16 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n16 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n17 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n17 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n18 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc1n18 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n19 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc1n29 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n01 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n02 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,15999,59001,9001,9002,9003,9004,9005 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n08 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n09 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998,8080 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n03 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22,1099,8443,9443 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n04 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n05 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n06 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 4529,8998 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n07 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n10 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n11 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n12 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n13 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n15 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n16 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n16 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n17 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n17 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n18 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -p tcp -m multiport --dports 7000,9042,9160,2181,2888,3888 -m state --state NEW,ESTABLISHED -j REJECT"
ansible dc2n18 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n19 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

ansible dc2n29 -ba "iptables -t filter -A CONSUL_INPUT -i eth0  -s 0/0 -p tcp -m multiport --dports 22 -m state --state NEW,ESTABLISHED -j ACCEPT"

#


#
## client nodes sidecars
#
#
## configuration for edge-zk-2181
#
ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 2181 -j DNAT --to-destination 127.0.0.1:30218"
ansible dc1n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.213:2181"
# file: "edge-dc1n13-zk-2181.json"
ansible dc1n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n13-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n13-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n13-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 2181 -j DNAT --to-destination 127.0.0.1:30219"
ansible dc1n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.215:2181"
# file: "edge-dc1n15-zk-2181.json"
ansible dc1n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n15-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n15-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n15-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 2181 -j DNAT --to-destination 127.0.0.1:30220"
ansible dc1n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.216:2181"
# file: "edge-dc1n16-zk-2181.json"
ansible dc1n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n16-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n16-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n16-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 2181 -j DNAT --to-destination 127.0.0.1:30221"
ansible dc1n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.217:2181"
# file: "edge-dc1n17-zk-2181.json"
ansible dc1n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n17-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n17-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n17-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 2181 -j DNAT --to-destination 127.0.0.1:30222"
ansible dc1n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.3.218:2181"
# file: "edge-dc1n18-zk-2181.json"
ansible dc1n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n18-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc1n18-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n18-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.213 --dport 2181 -j DNAT --to-destination 127.0.0.1:30231"
ansible dc2n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.5.213:2181"
# file: "edge-dc2n13-zk-2181.json"
ansible dc2n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n13-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n13-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n13-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.215 --dport 2181 -j DNAT --to-destination 127.0.0.1:30232"
ansible dc2n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.5.215:2181"
# file: "edge-dc2n15-zk-2181.json"
ansible dc2n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n15-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n15-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n15-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.216 --dport 2181 -j DNAT --to-destination 127.0.0.1:30233"
ansible dc2n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.5.216:2181"
# file: "edge-dc2n16-zk-2181.json"
ansible dc2n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n16-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n16-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n16-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.217 --dport 2181 -j DNAT --to-destination 127.0.0.1:30234"
ansible dc2n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.5.217:2181"
# file: "edge-dc2n17-zk-2181.json"
ansible dc2n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n17-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n17-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n17-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.218 --dport 2181 -j DNAT --to-destination 127.0.0.1:30235"
ansible dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2181 -j DNAT --to-destination 10.119.5.218:2181"
# file: "edge-dc2n18-zk-2181.json"
ansible dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n18-zk-2181  &> /opt/hashicorp/consul/logs/edge-dc2n18-zk-2181.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n18-zk-2181.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2181 &> /opt/hashicorp/consul/logs/edge-zk-2181.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2181.pid'
#


#
## configuration for edge-zk-2888
#
ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 2888 -j DNAT --to-destination 127.0.0.1:30281"
ansible dc1n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.213:2888"
# file: "edge-dc1n13-zk-2888.json"
ansible dc1n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n13-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n13-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n13-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 2888 -j DNAT --to-destination 127.0.0.1:30282"
ansible dc1n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.215:2888"
# file: "edge-dc1n15-zk-2888.json"
ansible dc1n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n15-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n15-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n15-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 2888 -j DNAT --to-destination 127.0.0.1:30283"
ansible dc1n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.216:2888"
# file: "edge-dc1n16-zk-2888.json"
ansible dc1n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n16-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n16-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n16-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 2888 -j DNAT --to-destination 127.0.0.1:30284"
ansible dc1n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.217:2888"
# file: "edge-dc1n17-zk-2888.json"
ansible dc1n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n17-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n17-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n17-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 2888 -j DNAT --to-destination 127.0.0.1:30285"
ansible dc1n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.3.218:2888"
# file: "edge-dc1n18-zk-2888.json"
ansible dc1n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n18-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc1n18-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n18-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.213 --dport 2888 -j DNAT --to-destination 127.0.0.1:30286"
ansible dc2n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.5.213:2888"
# file: "edge-dc2n13-zk-2888.json"
ansible dc2n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n13-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n13-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n13-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.215 --dport 2888 -j DNAT --to-destination 127.0.0.1:30287"
ansible dc2n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.5.215:2888"
# file: "edge-dc2n15-zk-2888.json"
ansible dc2n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n15-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n15-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n15-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.216 --dport 2888 -j DNAT --to-destination 127.0.0.1:30288"
ansible dc2n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.5.216:2888"
# file: "edge-dc2n16-zk-2888.json"
ansible dc2n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n16-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n16-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n16-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.217 --dport 2888 -j DNAT --to-destination 127.0.0.1:30289"
ansible dc2n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.5.217:2888"
# file: "edge-dc2n17-zk-2888.json"
ansible dc2n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n17-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n17-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n17-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.218 --dport 2888 -j DNAT --to-destination 127.0.0.1:30290"
ansible dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 2888 -j DNAT --to-destination 10.119.5.218:2888"
# file: "edge-dc2n18-zk-2888.json"
ansible dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n18-zk-2888  &> /opt/hashicorp/consul/logs/edge-dc2n18-zk-2888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n18-zk-2888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-2888 &> /opt/hashicorp/consul/logs/edge-zk-2888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-2888.pid'
#


#
## configuration for edge-zk-3888
#
ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 3888 -j DNAT --to-destination 127.0.0.1:30381"
ansible dc1n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.213:3888"
# file: "edge-dc1n13-zk-3888.json"
ansible dc1n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n13-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n13-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n13-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 3888 -j DNAT --to-destination 127.0.0.1:30382"
ansible dc1n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.215:3888"
# file: "edge-dc1n15-zk-3888.json"
ansible dc1n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n15-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n15-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n15-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 3888 -j DNAT --to-destination 127.0.0.1:30383"
ansible dc1n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.216:3888"
# file: "edge-dc1n16-zk-3888.json"
ansible dc1n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n16-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n16-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n16-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 3888 -j DNAT --to-destination 127.0.0.1:30384"
ansible dc1n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.217:3888"
# file: "edge-dc1n17-zk-3888.json"
ansible dc1n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n17-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n17-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n17-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 3888 -j DNAT --to-destination 127.0.0.1:30385"
ansible dc1n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.3.218:3888"
# file: "edge-dc1n18-zk-3888.json"
ansible dc1n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n18-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc1n18-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n18-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.213 --dport 3888 -j DNAT --to-destination 127.0.0.1:30386"
ansible dc2n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.5.213:3888"
# file: "edge-dc2n13-zk-3888.json"
ansible dc2n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n13-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n13-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n13-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.215 --dport 3888 -j DNAT --to-destination 127.0.0.1:30387"
ansible dc2n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.5.215:3888"
# file: "edge-dc2n15-zk-3888.json"
ansible dc2n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n15-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n15-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n15-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.216 --dport 3888 -j DNAT --to-destination 127.0.0.1:30388"
ansible dc2n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.5.216:3888"
# file: "edge-dc2n16-zk-3888.json"
ansible dc2n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n16-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n16-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n16-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.217 --dport 3888 -j DNAT --to-destination 127.0.0.1:30389"
ansible dc2n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.5.217:3888"
# file: "edge-dc2n17-zk-3888.json"
ansible dc2n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n17-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n17-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n17-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.218 --dport 3888 -j DNAT --to-destination 127.0.0.1:30390"
ansible dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 3888 -j DNAT --to-destination 10.119.5.218:3888"
# file: "edge-dc2n18-zk-3888.json"
ansible dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n18-zk-3888  &> /opt/hashicorp/consul/logs/edge-dc2n18-zk-3888.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n18-zk-3888.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-zk-3888 &> /opt/hashicorp/consul/logs/edge-zk-3888.log & echo $! > /opt/hashicorp/consul/logs/edge-zk-3888.pid'
#


#
## configuration for edge-cs-7000
#
ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 7000 -j DNAT --to-destination 127.0.0.1:30701"
ansible dc1n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.213:7000"
# file: "edge-dc1n13-cs-7000.json"
ansible dc1n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n13-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n13-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n13-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 7000 -j DNAT --to-destination 127.0.0.1:30702"
ansible dc1n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.215:7000"
# file: "edge-dc1n15-cs-7000.json"
ansible dc1n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n15-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n15-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n15-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 7000 -j DNAT --to-destination 127.0.0.1:30703"
ansible dc1n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.216:7000"
# file: "edge-dc1n16-cs-7000.json"
ansible dc1n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n16-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n16-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n16-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 7000 -j DNAT --to-destination 127.0.0.1:30704"
ansible dc1n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.217:7000"
# file: "edge-dc1n17-cs-7000.json"
ansible dc1n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n17-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n17-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n17-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 7000 -j DNAT --to-destination 127.0.0.1:30705"
ansible dc1n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.3.218:7000"
# file: "edge-dc1n18-cs-7000.json"
ansible dc1n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n18-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc1n18-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n18-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.213 --dport 7000 -j DNAT --to-destination 127.0.0.1:30706"
ansible dc2n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.5.213:7000"
# file: "edge-dc2n13-cs-7000.json"
ansible dc2n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n13-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n13-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n13-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.215 --dport 7000 -j DNAT --to-destination 127.0.0.1:30707"
ansible dc2n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.5.215:7000"
# file: "edge-dc2n15-cs-7000.json"
ansible dc2n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n15-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n15-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n15-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.216 --dport 7000 -j DNAT --to-destination 127.0.0.1:30708"
ansible dc2n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.5.216:7000"
# file: "edge-dc2n16-cs-7000.json"
ansible dc2n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n16-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n16-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n16-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.217 --dport 7000 -j DNAT --to-destination 127.0.0.1:30709"
ansible dc2n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.5.217:7000"
# file: "edge-dc2n17-cs-7000.json"
ansible dc2n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n17-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n17-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n17-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.218 --dport 7000 -j DNAT --to-destination 127.0.0.1:30710"
ansible dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 7000 -j DNAT --to-destination 10.119.5.218:7000"
# file: "edge-dc2n18-cs-7000.json"
ansible dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n18-cs-7000  &> /opt/hashicorp/consul/logs/edge-dc2n18-cs-7000.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n18-cs-7000.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-7000 &> /opt/hashicorp/consul/logs/edge-cs-7000.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-7000.pid'
#


#
## configuration for edge-cs-9042
#
ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 9042 -j DNAT --to-destination 127.0.0.1:30521"
ansible dc1n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.213:9042"
# file: "edge-dc1n13-cs-9042.json"
ansible dc1n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n13-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n13-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n13-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 9042 -j DNAT --to-destination 127.0.0.1:30522"
ansible dc1n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.215:9042"
# file: "edge-dc1n15-cs-9042.json"
ansible dc1n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n15-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n15-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n15-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 9042 -j DNAT --to-destination 127.0.0.1:30523"
ansible dc1n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.216:9042"
# file: "edge-dc1n16-cs-9042.json"
ansible dc1n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n16-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n16-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n16-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 9042 -j DNAT --to-destination 127.0.0.1:30524"
ansible dc1n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.217:9042"
# file: "edge-dc1n17-cs-9042.json"
ansible dc1n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n17-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n17-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n17-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 9042 -j DNAT --to-destination 127.0.0.1:30525"
ansible dc1n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.3.218:9042"
# file: "edge-dc1n18-cs-9042.json"
ansible dc1n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n18-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc1n18-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n18-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.213 --dport 9042 -j DNAT --to-destination 127.0.0.1:30526"
ansible dc2n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.5.213:9042"
# file: "edge-dc2n13-cs-9042.json"
ansible dc2n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n13-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n13-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n13-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.215 --dport 9042 -j DNAT --to-destination 127.0.0.1:30527"
ansible dc2n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.5.215:9042"
# file: "edge-dc2n15-cs-9042.json"
ansible dc2n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n15-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n15-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n15-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.216 --dport 9042 -j DNAT --to-destination 127.0.0.1:30528"
ansible dc2n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.5.216:9042"
# file: "edge-dc2n16-cs-9042.json"
ansible dc2n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n16-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n16-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n16-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.217 --dport 9042 -j DNAT --to-destination 127.0.0.1:30529"
ansible dc2n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.5.217:9042"
# file: "edge-dc2n17-cs-9042.json"
ansible dc2n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n17-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n17-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n17-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.218 --dport 9042 -j DNAT --to-destination 127.0.0.1:30530"
ansible dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9042 -j DNAT --to-destination 10.119.5.218:9042"
# file: "edge-dc2n18-cs-9042.json"
ansible dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n18-cs-9042  &> /opt/hashicorp/consul/logs/edge-dc2n18-cs-9042.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n18-cs-9042.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9042 &> /opt/hashicorp/consul/logs/edge-cs-9042.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9042.pid'
#


#
## configuration for edge-cs-9160
#
ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.213 --dport 9160 -j DNAT --to-destination 127.0.0.1:30601"
ansible dc1n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.213:9160"
# file: "edge-dc1n13-cs-9160.json"
ansible dc1n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n13-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n13-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n13-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.215 --dport 9160 -j DNAT --to-destination 127.0.0.1:30602"
ansible dc1n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.215:9160"
# file: "edge-dc1n15-cs-9160.json"
ansible dc1n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n15-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n15-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n15-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.216 --dport 9160 -j DNAT --to-destination 127.0.0.1:30603"
ansible dc1n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.216:9160"
# file: "edge-dc1n16-cs-9160.json"
ansible dc1n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n16-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n16-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n16-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.217 --dport 9160 -j DNAT --to-destination 127.0.0.1:30604"
ansible dc1n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.217:9160"
# file: "edge-dc1n17-cs-9160.json"
ansible dc1n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n17-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n17-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n17-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.218 --dport 9160 -j DNAT --to-destination 127.0.0.1:30605"
ansible dc1n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.3.218:9160"
# file: "edge-dc1n18-cs-9160.json"
ansible dc1n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n18-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc1n18-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n18-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.213 --dport 9160 -j DNAT --to-destination 127.0.0.1:30606"
ansible dc2n13 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.5.213:9160"
# file: "edge-dc2n13-cs-9160.json"
ansible dc2n13 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n13-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n13-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n13-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.215 --dport 9160 -j DNAT --to-destination 127.0.0.1:30607"
ansible dc2n15 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.5.215:9160"
# file: "edge-dc2n15-cs-9160.json"
ansible dc2n15 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n15-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n15-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n15-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.216 --dport 9160 -j DNAT --to-destination 127.0.0.1:30608"
ansible dc2n16 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.5.216:9160"
# file: "edge-dc2n16-cs-9160.json"
ansible dc2n16 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n16-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n16-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n16-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.217 --dport 9160 -j DNAT --to-destination 127.0.0.1:30609"
ansible dc2n17 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.5.217:9160"
# file: "edge-dc2n17-cs-9160.json"
ansible dc2n17 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n17-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n17-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n17-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.218 --dport 9160 -j DNAT --to-destination 127.0.0.1:30610"
ansible dc2n18 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 9160 -j DNAT --to-destination 10.119.5.218:9160"
# file: "edge-dc2n18-cs-9160.json"
ansible dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n18-cs-9160  &> /opt/hashicorp/consul/logs/edge-dc2n18-cs-9160.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n18-cs-9160.pid'

ansible dc1n13,dc1n15,dc1n16,dc1n17,dc1n18,dc2n13,dc2n15,dc2n16,dc2n17,dc2n18 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-cs-9160 &> /opt/hashicorp/consul/logs/edge-cs-9160.log & echo $! > /opt/hashicorp/consul/logs/edge-cs-9160.pid'
#


#
## configuration for edge-mp-4529
#
ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.203 --dport 4529 -j DNAT --to-destination 127.0.0.1:30903"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.203:4529"
# file: "edge-dc1n03-mp-4529.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc1n03-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.204 --dport 4529 -j DNAT --to-destination 127.0.0.1:30904"
ansible dc1n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.204:4529"
# file: "edge-dc1n04-mp-4529.json"
ansible dc1n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n04-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc1n04-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n04-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.205 --dport 4529 -j DNAT --to-destination 127.0.0.1:30905"
ansible dc1n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.205:4529"
# file: "edge-dc1n05-mp-4529.json"
ansible dc1n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n05-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc1n05-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n05-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.206 --dport 4529 -j DNAT --to-destination 127.0.0.1:30906"
ansible dc1n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.206:4529"
# file: "edge-dc1n06-mp-4529.json"
ansible dc1n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n06-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc1n06-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n06-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.207 --dport 4529 -j DNAT --to-destination 127.0.0.1:30907"
ansible dc1n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.3.207:4529"
# file: "edge-dc1n07-mp-4529.json"
ansible dc1n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n07-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc1n07-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n07-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.203 --dport 4529 -j DNAT --to-destination 127.0.0.1:30910"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.5.203:4529"
# file: "edge-dc2n03-mp-4529.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc2n03-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.204 --dport 4529 -j DNAT --to-destination 127.0.0.1:30911"
ansible dc2n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.5.204:4529"
# file: "edge-dc2n04-mp-4529.json"
ansible dc2n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n04-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc2n04-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n04-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.205 --dport 4529 -j DNAT --to-destination 127.0.0.1:30912"
ansible dc2n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.5.205:4529"
# file: "edge-dc2n05-mp-4529.json"
ansible dc2n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n05-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc2n05-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n05-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.206 --dport 4529 -j DNAT --to-destination 127.0.0.1:30913"
ansible dc2n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.5.206:4529"
# file: "edge-dc2n06-mp-4529.json"
ansible dc2n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n06-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc2n06-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n06-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.207 --dport 4529 -j DNAT --to-destination 127.0.0.1:30914"
ansible dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 4529 -j DNAT --to-destination 10.119.5.207:4529"
# file: "edge-dc2n07-mp-4529.json"
ansible dc2n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n07-mp-4529  &> /opt/hashicorp/consul/logs/edge-dc2n07-mp-4529.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n07-mp-4529.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-4529 &> /opt/hashicorp/consul/logs/edge-mp-4529.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-4529.pid'
#


#
## configuration for edge-mp-8998
#
ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.203 --dport 8998 -j DNAT --to-destination 127.0.0.1:30853"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.203:8998"
# file: "edge-dc1n03-mp-8998.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc1n03-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.204 --dport 8998 -j DNAT --to-destination 127.0.0.1:30854"
ansible dc1n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.204:8998"
# file: "edge-dc1n04-mp-8998.json"
ansible dc1n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n04-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc1n04-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n04-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.205 --dport 8998 -j DNAT --to-destination 127.0.0.1:30855"
ansible dc1n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.205:8998"
# file: "edge-dc1n05-mp-8998.json"
ansible dc1n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n05-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc1n05-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n05-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.206 --dport 8998 -j DNAT --to-destination 127.0.0.1:30856"
ansible dc1n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.206:8998"
# file: "edge-dc1n06-mp-8998.json"
ansible dc1n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n06-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc1n06-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n06-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.207 --dport 8998 -j DNAT --to-destination 127.0.0.1:30857"
ansible dc1n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.3.207:8998"
# file: "edge-dc1n07-mp-8998.json"
ansible dc1n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n07-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc1n07-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n07-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.203 --dport 8998 -j DNAT --to-destination 127.0.0.1:30860"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.5.203:8998"
# file: "edge-dc2n03-mp-8998.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc2n03-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.204 --dport 8998 -j DNAT --to-destination 127.0.0.1:30861"
ansible dc2n04 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.5.204:8998"
# file: "edge-dc2n04-mp-8998.json"
ansible dc2n04 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n04-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc2n04-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n04-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.205 --dport 8998 -j DNAT --to-destination 127.0.0.1:30862"
ansible dc2n05 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.5.205:8998"
# file: "edge-dc2n05-mp-8998.json"
ansible dc2n05 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n05-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc2n05-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n05-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.206 --dport 8998 -j DNAT --to-destination 127.0.0.1:30863"
ansible dc2n06 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.5.206:8998"
# file: "edge-dc2n06-mp-8998.json"
ansible dc2n06 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n06-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc2n06-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n06-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.207 --dport 8998 -j DNAT --to-destination 127.0.0.1:30864"
ansible dc2n07 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8998 -j DNAT --to-destination 10.119.5.207:8998"
# file: "edge-dc2n07-mp-8998.json"
ansible dc2n07 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n07-mp-8998  &> /opt/hashicorp/consul/logs/edge-dc2n07-mp-8998.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n07-mp-8998.pid'

ansible dc1n01,dc1n02,dc2n01,dc2n02 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-mp-8998 &> /opt/hashicorp/consul/logs/edge-mp-8998.log & echo $! > /opt/hashicorp/consul/logs/edge-mp-8998.pid'
#


#
## configuration for edge-ms-8080
#
ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.3.203 --dport 8080 -j DNAT --to-destination 127.0.0.1:30803"
ansible dc1n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j DNAT --to-destination 10.119.3.203:8080"
# file: "edge-dc1n03-ms-8080.json"
ansible dc1n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc1n03-ms-8080  &> /opt/hashicorp/consul/logs/edge-dc1n03-ms-8080.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc1n03-ms-8080.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 10.119.5.203 --dport 8080 -j DNAT --to-destination 127.0.0.1:30811"
ansible dc2n03 -ba "iptables -t nat -A CONSUL_OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j DNAT --to-destination 10.119.5.203:8080"
# file: "edge-dc2n03-ms-8080.json"
ansible dc2n03 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -sidecar-for edge-dc2n03-ms-8080  &> /opt/hashicorp/consul/logs/edge-dc2n03-ms-8080.log &  echo $! > /opt/hashicorp/consul/logs/edge-dc2n03-ms-8080.pid'

ansible dc1n01,dc1n02,dc1n03,dc1n04,dc1n05,dc1n06,dc1n07,dc1n19,dc2n01,dc2n02,dc2n03,dc2n04,dc2n05,dc2n06,dc2n07,dc2n19 --become --become-user consul -m shell -a 'nohup /opt/hashicorp/consul/bin/consul connect proxy -service edge-ms-8080 &> /opt/hashicorp/consul/logs/edge-ms-8080.log & echo $! > /opt/hashicorp/consul/logs/edge-ms-8080.pid'
#


