ansible n02 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-zk-2181.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-zk-2181.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-zk-2181.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-zk-2181.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-n04-zk-2181.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n04-zk-2181.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-zk-2888.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-zk-2888.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-zk-2888.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-zk-2888.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-n04-zk-2888.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n04-zk-2888.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-zk-3888.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-zk-3888.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-zk-3888.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-zk-3888.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-n04-zk-3888.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n04-zk-3888.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-cs-7000.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-cs-7000.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-cs-7000.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-cs-7000.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-n04-cs-7000.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n04-cs-7000.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-cs-9042.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-cs-9042.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-cs-9042.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-cs-9042.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-n04-cs-9042.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n04-cs-9042.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-cs-9160.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-cs-9160.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-cs-9160.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-cs-9160.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible n04 -m copy -a "src=/tmp/edge-n04-cs-9160.json dest=/opt/consul-install/"
ansible n04 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n04-cs-9160.json dest=/etc/consul.d"

ansible n09 -m copy -a "src=/tmp/edge-ms-8080.json dest=/opt/consul-install/"
ansible n09 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-ms-8080.json dest=/etc/consul.d"

ansible n09 -m copy -a "src=/tmp/edge-n09-ms-8080.json dest=/opt/consul-install/"
ansible n09 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n09-ms-8080.json dest=/etc/consul.d"

ansible consul -a "consul reload"
