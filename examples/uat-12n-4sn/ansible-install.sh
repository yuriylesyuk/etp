ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n02-ds.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n03-ds.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n04-ds.cfg"







ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n02-ol.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-ms.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-ui.cfg"

ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n06-sax.cfg"

ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n05-qs.cfg"



ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n11-rmp.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n12-rmp.cfg"

ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n07-r.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n08-r.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n09-mp.cfg"
ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n10-mp.cfg"



ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n05-bs.cfg"



ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/uat-dc1-n01-dp.cfg"







