ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n01-ds.cfg"
ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n02-ds.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n03-ds.cfg"





ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n01-olmsui.cfg"







ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n04-sax.cfg"
ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n05-sax.cfg"





ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n02-rmp.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n03-rmp.cfg"











ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP= CFG=configs/qa-dc1-n06-dp.cfg"







