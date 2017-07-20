ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-dc1-n13-ol.cfg"

ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-dc1-n03-ms.cfg"

ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc1-n10-bs.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc1-n11-bs.cfg"

ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc1-all-ms.cfg"







