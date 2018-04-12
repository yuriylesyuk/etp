ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n13-ds.cfg"
ansible-playbook -l n15 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n15-ds.cfg"
ansible-playbook -l n16 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n16-ds.cfg"
ansible-playbook -l n17 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n17-ds.cfg"
ansible-playbook -l n18 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n18-ds.cfg"







ansible-playbook -l n13 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n13-ol.cfg"

ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n03-ms.cfg"

ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n03-ui.cfg"

ansible-playbook -l n19 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n19-sax.cfg"







ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n01-r.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n02-r.cfg"

ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n03-mp.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n04-mp.cfg"
ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n05-mp.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n06-mp.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n07-mp.cfg"



ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n10-bs.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n11-bs.cfg"



ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n08-dp.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/prod-dc1-n09-dp.cfg"







