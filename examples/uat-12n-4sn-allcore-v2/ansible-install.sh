ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n02-ds.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n03-ds.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n04-ds.cfg"







ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n02-ol.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n03-ol.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-ms.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n14-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-ui.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n14-ui.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n01-sax.cfg"
ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n13-sax.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-qs.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n14-qs.cfg"



ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n07-rmp.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n08-rmp.cfg"

ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n11-r.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n12-r.cfg"

ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n05-mp.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n06-mp.cfg"



ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-bs.cfg"
ansible-playbook -l n14 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n14-bs.cfg"



ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n10-dp.cfg"
ansible-playbook -l n15 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n15-dp.cfg"







