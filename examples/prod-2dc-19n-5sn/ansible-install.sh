ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-dc1-n13-ol.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-dc1-n03-ms.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc1-n10-bs.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc1-n11-bs.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc1-all-ms.cfg"







ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-dc2-n13-ol.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-dc2-n03-ms.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc2-n10-bs.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc2-n11-bs.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc2-all-ms.cfg"







