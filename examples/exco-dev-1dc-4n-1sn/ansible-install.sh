ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n01-ds.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n02-ds.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n03-ds.cfg"





ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n01-olmsui.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n02-olmsui.cfg"







ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n02-sax.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n03-sax.cfg"





ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n03-rmp.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/nonprod-dc1-n04-rmp.cfg"



















