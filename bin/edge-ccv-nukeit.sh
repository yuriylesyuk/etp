echo "# nuking edge-ccv configuration: Q&D!"

ansible consul -m shell -a "pkill consul"


ansible consul -bm shell -a "rm -rf /etc/consul.d/edge-*.json"

ansible consul -m shell -a "rm -rf /opt/hashicorp/consul/bin/*"

ansible consul -m shell -a "rm -rf /opt/hashicorp/consul/data/*"

ansible consul -m shell -a "rm -rf /opt/hashicorp/consul/logs/*"

ansible consul -bm shell -a "iptables -t nat -F"