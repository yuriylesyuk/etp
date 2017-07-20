ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=uat-dc1-n02-ol.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=uat-dc1-n03-ol.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=uat-dc1-n14-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=uat-dc1-n09-bs.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=uat-dc1-n14-bs.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp.yml -e "COMP=influxdb CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n05 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=uat-dc1-all-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp.yml -e "COMP=grafana CFG=uat-dc1-all-ms.cfg"

