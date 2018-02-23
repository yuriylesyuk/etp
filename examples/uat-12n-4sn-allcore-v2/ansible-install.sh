ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=configs/uat-dc1-n02-zk.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=configs/uat-dc1-n03-zk.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=configs/uat-dc1-n04-zk.cfg"

ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=configs/uat-dc1-n02-cs.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=configs/uat-dc1-n03-cs.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=configs/uat-dc1-n04-cs.cfg"

ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=configs/uat-dc1-n02-ol.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=configs/uat-dc1-n03-ol.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=configs/uat-dc1-n14-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=configs/uat-dc1-n09-ui.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=configs/uat-dc1-n14-ui.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=configs/uat-dc1-n01-qs.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=configs/uat-dc1-n09-qs.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=configs/uat-dc1-n13-qs.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=configs/uat-dc1-n14-qs.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=configs/uat-dc1-n01-ps.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=configs/uat-dc1-n13-ps.cfg"

ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=configs/uat-dc1-n07-r.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=configs/uat-dc1-n08-r.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=configs/uat-dc1-n11-r.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=configs/uat-dc1-n12-r.cfg"

ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=configs/uat-dc1-n05-mp.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=configs/uat-dc1-n06-mp.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=configs/uat-dc1-n07-mp.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=configs/uat-dc1-n08-mp.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=configs/uat-dc1-all-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=configs/uat-dc1-n09-bs.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=configs/uat-dc1-n14-bs.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=configs/uat-dc1-all-ms.cfg"

ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=configs/uat-dc1-n10-dp.cfg"
ansible-playbook -l n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=configs/uat-dc1-n15-dp.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp.yml -e "COMP=influxdb CFG=configs/uat-dc1-all-ms.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n05 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp.yml -e "COMP=telegraf CFG=configs/uat-dc1-all-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp.yml -e "COMP=grafana CFG=configs/uat-dc1-all-ms.cfg"

