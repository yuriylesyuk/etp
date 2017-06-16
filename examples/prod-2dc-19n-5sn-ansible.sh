ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-2dc-19n-5sn-dc1.cfg"

ansible-playbook -l dc1n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-2dc-19n-5sn-dc1.cfg"
ansible-playbook -l dc1n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-2dc-19n-5sn-dc1.cfg"







ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-2dc-19n-5sn-dc2.cfg"

ansible-playbook -l dc2n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-2dc-19n-5sn-dc2.cfg"
ansible-playbook -l dc2n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-2dc-19n-5sn-dc2.cfg"







