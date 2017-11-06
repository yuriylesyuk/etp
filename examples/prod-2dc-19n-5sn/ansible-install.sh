ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-n13-zk.cfg"
ansible-playbook -l dc1n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-n15-zk.cfg"
ansible-playbook -l dc1n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-n16-zk.cfg"
ansible-playbook -l dc1n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-n17-zk.cfg"
ansible-playbook -l dc1n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc1-n18-zk.cfg"

ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-n13-cs.cfg"
ansible-playbook -l dc1n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-n15-cs.cfg"
ansible-playbook -l dc1n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-n16-cs.cfg"
ansible-playbook -l dc1n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-n17-cs.cfg"
ansible-playbook -l dc1n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc1-n18-cs.cfg"

ansible-playbook -l dc1n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-dc1-n13-ol.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-dc1-n03-ms.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-dc1-n03-ui.cfg"

ansible-playbook -l dc1n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-dc1-n19-qs.cfg"

ansible-playbook -l dc1n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-dc1-n19-ps.cfg"

ansible-playbook -l dc1n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc1-n01-r.cfg"
ansible-playbook -l dc1n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc1-n02-r.cfg"

ansible-playbook -l dc1n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-n03-mp.cfg"
ansible-playbook -l dc1n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-n04-mp.cfg"
ansible-playbook -l dc1n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-n05-mp.cfg"
ansible-playbook -l dc1n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-n06-mp.cfg"
ansible-playbook -l dc1n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc1-n07-mp.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc1-n10-bs.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc1-n11-bs.cfg"

ansible-playbook -l dc1n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc1-all-ms.cfg"
ansible-playbook -l dc1n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc1-all-ms.cfg"

ansible-playbook -l dc1n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc1-n08-dp.cfg"
ansible-playbook -l dc1n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc1-n09-dp.cfg"







ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-n13-zk.cfg"
ansible-playbook -l dc2n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-n15-zk.cfg"
ansible-playbook -l dc2n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-n16-zk.cfg"
ansible-playbook -l dc2n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-n17-zk.cfg"
ansible-playbook -l dc2n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=prod-dc2-n18-zk.cfg"

ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-n13-cs.cfg"
ansible-playbook -l dc2n15 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-n15-cs.cfg"
ansible-playbook -l dc2n16 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-n16-cs.cfg"
ansible-playbook -l dc2n17 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-n17-cs.cfg"
ansible-playbook -l dc2n18 $OPS_HOME/edge-comp-setup.yml -e "COMP=c CFG=prod-dc2-n18-cs.cfg"

ansible-playbook -l dc2n13 $OPS_HOME/edge-comp-setup.yml -e "COMP=ld CFG=prod-dc2-n13-ol.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=prod-dc2-n03-ms.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=prod-dc2-n03-ui.cfg"

ansible-playbook -l dc2n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=qs CFG=prod-dc2-n19-qs.cfg"

ansible-playbook -l dc2n19 $OPS_HOME/edge-comp-setup.yml -e "COMP=ps CFG=prod-dc2-n19-ps.cfg"

ansible-playbook -l dc2n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc2-n01-r.cfg"
ansible-playbook -l dc2n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=prod-dc2-n02-r.cfg"

ansible-playbook -l dc2n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-n03-mp.cfg"
ansible-playbook -l dc2n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-n04-mp.cfg"
ansible-playbook -l dc2n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-n05-mp.cfg"
ansible-playbook -l dc2n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-n06-mp.cfg"
ansible-playbook -l dc2n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=prod-dc2-n07-mp.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=e CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc2-n10-bs.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=b CFG=prod-dc2-n11-bs.cfg"

ansible-playbook -l dc2n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc2-all-ms.cfg"
ansible-playbook -l dc2n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=p CFG=prod-dc2-all-ms.cfg"

ansible-playbook -l dc2n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc2-n08-dp.cfg"
ansible-playbook -l dc2n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=prod-dc2-n09-dp.cfg"







