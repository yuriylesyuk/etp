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

ansible n07 -m copy -a "src=/tmp/edge-mp-4529.json dest=/opt/consul-install/"
ansible n07 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-4529.json dest=/etc/consul.d"

ansible n07 -m copy -a "src=/tmp/edge-n07-mp-4529.json dest=/opt/consul-install/"
ansible n07 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n07-mp-4529.json dest=/etc/consul.d"

ansible n08 -m copy -a "src=/tmp/edge-mp-4529.json dest=/opt/consul-install/"
ansible n08 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-4529.json dest=/etc/consul.d"

ansible n08 -m copy -a "src=/tmp/edge-n08-mp-4529.json dest=/opt/consul-install/"
ansible n08 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n08-mp-4529.json dest=/etc/consul.d"

ansible n05 -m copy -a "src=/tmp/edge-mp-4529.json dest=/opt/consul-install/"
ansible n05 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-4529.json dest=/etc/consul.d"

ansible n05 -m copy -a "src=/tmp/edge-n05-mp-4529.json dest=/opt/consul-install/"
ansible n05 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n05-mp-4529.json dest=/etc/consul.d"

ansible n06 -m copy -a "src=/tmp/edge-mp-4529.json dest=/opt/consul-install/"
ansible n06 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-4529.json dest=/etc/consul.d"

ansible n06 -m copy -a "src=/tmp/edge-n06-mp-4529.json dest=/opt/consul-install/"
ansible n06 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n06-mp-4529.json dest=/etc/consul.d"

ansible n07 -m copy -a "src=/tmp/edge-mp-8998.json dest=/opt/consul-install/"
ansible n07 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-8998.json dest=/etc/consul.d"

ansible n07 -m copy -a "src=/tmp/edge-n07-mp-8998.json dest=/opt/consul-install/"
ansible n07 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n07-mp-8998.json dest=/etc/consul.d"

ansible n08 -m copy -a "src=/tmp/edge-mp-8998.json dest=/opt/consul-install/"
ansible n08 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-8998.json dest=/etc/consul.d"

ansible n08 -m copy -a "src=/tmp/edge-n08-mp-8998.json dest=/opt/consul-install/"
ansible n08 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n08-mp-8998.json dest=/etc/consul.d"

ansible n05 -m copy -a "src=/tmp/edge-mp-8998.json dest=/opt/consul-install/"
ansible n05 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-8998.json dest=/etc/consul.d"

ansible n05 -m copy -a "src=/tmp/edge-n05-mp-8998.json dest=/opt/consul-install/"
ansible n05 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n05-mp-8998.json dest=/etc/consul.d"

ansible n06 -m copy -a "src=/tmp/edge-mp-8998.json dest=/opt/consul-install/"
ansible n06 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-mp-8998.json dest=/etc/consul.d"

ansible n06 -m copy -a "src=/tmp/edge-n06-mp-8998.json dest=/opt/consul-install/"
ansible n06 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n06-mp-8998.json dest=/etc/consul.d"

ansible n09 -m copy -a "src=/tmp/edge-ms-8080.json dest=/opt/consul-install/"
ansible n09 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-ms-8080.json dest=/etc/consul.d"

ansible n09 -m copy -a "src=/tmp/edge-n09-ms-8080.json dest=/opt/consul-install/"
ansible n09 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n09-ms-8080.json dest=/etc/consul.d"

ansible n14 -m copy -a "src=/tmp/edge-ms-8080.json dest=/opt/consul-install/"
ansible n14 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-ms-8080.json dest=/etc/consul.d"

ansible n14 -m copy -a "src=/tmp/edge-n14-ms-8080.json dest=/opt/consul-install/"
ansible n14 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n14-ms-8080.json dest=/etc/consul.d"

ansible consul -a "consul reload"
