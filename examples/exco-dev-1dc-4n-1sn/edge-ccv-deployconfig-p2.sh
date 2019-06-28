ansible n01 -m copy -a "src=/tmp/edge-n01-zk-2181.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-zk-2181.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-zk-2181.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-zk-2181.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-zk-2181.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-zk-2181.json dest=/etc/consul.d"

ansible n01 -m copy -a "src=/tmp/edge-n01-zk-2888.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-zk-2888.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-zk-2888.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-zk-2888.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-zk-2888.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-zk-2888.json dest=/etc/consul.d"

ansible n01 -m copy -a "src=/tmp/edge-n01-zk-3888.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-zk-3888.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-zk-3888.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-zk-3888.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-zk-3888.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-zk-3888.json dest=/etc/consul.d"

ansible n01 -m copy -a "src=/tmp/edge-n01-cs-7000.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-cs-7000.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-cs-7000.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-cs-7000.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-cs-7000.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-cs-7000.json dest=/etc/consul.d"

ansible n01 -m copy -a "src=/tmp/edge-n01-cs-9042.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-cs-9042.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-cs-9042.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-cs-9042.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-cs-9042.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-cs-9042.json dest=/etc/consul.d"

ansible n01 -m copy -a "src=/tmp/edge-n01-cs-9160.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-cs-9160.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-cs-9160.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-cs-9160.json dest=/etc/consul.d"

ansible n03 -m copy -a "src=/tmp/edge-n03-cs-9160.json dest=/opt/consul-install/"
ansible n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n03-cs-9160.json dest=/etc/consul.d"

ansible n01 -m copy -a "src=/tmp/edge-n01-ms-8080.json dest=/opt/consul-install/"
ansible n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n01-ms-8080.json dest=/etc/consul.d"

ansible n02 -m copy -a "src=/tmp/edge-n02-ms-8080.json dest=/opt/consul-install/"
ansible n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-n02-ms-8080.json dest=/etc/consul.d"

ansible consul -a "consul reload"
