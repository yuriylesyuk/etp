ansible dc1n01 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-dc1n01-zk-2181.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n01-zk-2181.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-dc1n02-zk-2181.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n02-zk-2181.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-dc1n03-zk-2181.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n03-zk-2181.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-dc2n01-zk-2181.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n01-zk-2181.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-dc2n02-zk-2181.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n02-zk-2181.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-dc2n03-zk-2181.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n03-zk-2181.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-dc3n01-zk-2181.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n01-zk-2181.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-dc3n02-zk-2181.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n02-zk-2181.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-dc3n03-zk-2181.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n03-zk-2181.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-dc4n01-zk-2181.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n01-zk-2181.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-dc4n02-zk-2181.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n02-zk-2181.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-zk-2181.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2181.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-dc4n03-zk-2181.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n03-zk-2181.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-dc1n01-zk-2888.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n01-zk-2888.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-dc1n02-zk-2888.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n02-zk-2888.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-dc1n03-zk-2888.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n03-zk-2888.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-dc2n01-zk-2888.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n01-zk-2888.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-dc2n02-zk-2888.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n02-zk-2888.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-dc2n03-zk-2888.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n03-zk-2888.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-dc3n01-zk-2888.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n01-zk-2888.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-dc3n02-zk-2888.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n02-zk-2888.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-dc3n03-zk-2888.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n03-zk-2888.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-dc4n01-zk-2888.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n01-zk-2888.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-dc4n02-zk-2888.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n02-zk-2888.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-zk-2888.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-2888.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-dc4n03-zk-2888.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n03-zk-2888.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-dc1n01-zk-3888.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n01-zk-3888.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-dc1n02-zk-3888.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n02-zk-3888.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-dc1n03-zk-3888.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n03-zk-3888.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-dc2n01-zk-3888.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n01-zk-3888.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-dc2n02-zk-3888.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n02-zk-3888.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-dc2n03-zk-3888.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n03-zk-3888.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-dc3n01-zk-3888.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n01-zk-3888.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-dc3n02-zk-3888.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n02-zk-3888.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-dc3n03-zk-3888.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n03-zk-3888.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-dc4n01-zk-3888.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n01-zk-3888.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-dc4n02-zk-3888.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n02-zk-3888.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-zk-3888.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-zk-3888.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-dc4n03-zk-3888.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n03-zk-3888.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-dc1n01-cs-7000.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n01-cs-7000.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-dc1n02-cs-7000.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n02-cs-7000.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-dc1n03-cs-7000.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n03-cs-7000.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-dc2n01-cs-7000.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n01-cs-7000.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-dc2n02-cs-7000.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n02-cs-7000.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-dc2n03-cs-7000.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n03-cs-7000.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-dc3n01-cs-7000.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n01-cs-7000.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-dc3n02-cs-7000.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n02-cs-7000.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-dc3n03-cs-7000.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n03-cs-7000.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-dc4n01-cs-7000.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n01-cs-7000.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-dc4n02-cs-7000.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n02-cs-7000.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-cs-7000.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-7000.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-dc4n03-cs-7000.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n03-cs-7000.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-dc1n01-cs-9042.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n01-cs-9042.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-dc1n02-cs-9042.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n02-cs-9042.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-dc1n03-cs-9042.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n03-cs-9042.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-dc2n01-cs-9042.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n01-cs-9042.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-dc2n02-cs-9042.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n02-cs-9042.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-dc2n03-cs-9042.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n03-cs-9042.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-dc3n01-cs-9042.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n01-cs-9042.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-dc3n02-cs-9042.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n02-cs-9042.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-dc3n03-cs-9042.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n03-cs-9042.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-dc4n01-cs-9042.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n01-cs-9042.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-dc4n02-cs-9042.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n02-cs-9042.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-cs-9042.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9042.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-dc4n03-cs-9042.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n03-cs-9042.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc1n01 -m copy -a "src=/tmp/edge-dc1n01-cs-9160.json dest=/opt/consul-install/"
ansible dc1n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n01-cs-9160.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc1n02 -m copy -a "src=/tmp/edge-dc1n02-cs-9160.json dest=/opt/consul-install/"
ansible dc1n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n02-cs-9160.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc1n03 -m copy -a "src=/tmp/edge-dc1n03-cs-9160.json dest=/opt/consul-install/"
ansible dc1n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc1n03-cs-9160.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc2n01 -m copy -a "src=/tmp/edge-dc2n01-cs-9160.json dest=/opt/consul-install/"
ansible dc2n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n01-cs-9160.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc2n02 -m copy -a "src=/tmp/edge-dc2n02-cs-9160.json dest=/opt/consul-install/"
ansible dc2n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n02-cs-9160.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc2n03 -m copy -a "src=/tmp/edge-dc2n03-cs-9160.json dest=/opt/consul-install/"
ansible dc2n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc2n03-cs-9160.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc3n01 -m copy -a "src=/tmp/edge-dc3n01-cs-9160.json dest=/opt/consul-install/"
ansible dc3n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n01-cs-9160.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc3n02 -m copy -a "src=/tmp/edge-dc3n02-cs-9160.json dest=/opt/consul-install/"
ansible dc3n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n02-cs-9160.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc3n03 -m copy -a "src=/tmp/edge-dc3n03-cs-9160.json dest=/opt/consul-install/"
ansible dc3n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc3n03-cs-9160.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc4n01 -m copy -a "src=/tmp/edge-dc4n01-cs-9160.json dest=/opt/consul-install/"
ansible dc4n01 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n01-cs-9160.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc4n02 -m copy -a "src=/tmp/edge-dc4n02-cs-9160.json dest=/opt/consul-install/"
ansible dc4n02 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n02-cs-9160.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-cs-9160.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-cs-9160.json dest=/etc/consul.d"

ansible dc4n03 -m copy -a "src=/tmp/edge-dc4n03-cs-9160.json dest=/opt/consul-install/"
ansible dc4n03 -b -m copy -a "remote_src=yes src=/opt/consul-install/edge-dc4n03-cs-9160.json dest=/etc/consul.d"

ansible consul -a "consul reload"
