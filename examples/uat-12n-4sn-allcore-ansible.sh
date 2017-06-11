ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=dc1.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=dc1.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=zk CFG=dc1.cfg"

ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=cs CFG=dc1.cfg"
ansible-playbook -l n03 $OPS_HOME/edge-comp-setup.yml -e "COMP=cs CFG=dc1.cfg"
ansible-playbook -l n04 $OPS_HOME/edge-comp-setup.yml -e "COMP=cs CFG=dc1.cfg"

ansible-playbook -l n02 $OPS_HOME/edge-comp-setup.yml -e "COMP=ol CFG=dc1.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=ms CFG=dc1.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=ui CFG=dc1.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=qis CFG=dc1.cfg"
ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=qis CFG=dc1.cfg"

ansible-playbook -l n01 $OPS_HOME/edge-comp-setup.yml -e "COMP=pg CFG=dc1.cfg"





ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=dc1.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=dc1.cfg"
ansible-playbook -l n11 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=dc1.cfg"
ansible-playbook -l n12 $OPS_HOME/edge-comp-setup.yml -e "COMP=r CFG=dc1.cfg"

ansible-playbook -l n05 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=dc1.cfg"
ansible-playbook -l n06 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=dc1.cfg"
ansible-playbook -l n07 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=dc1.cfg"
ansible-playbook -l n08 $OPS_HOME/edge-comp-setup.yml -e "COMP=mp CFG=dc1.cfg"

ansible-playbook -l n10 $OPS_HOME/edge-comp-setup.yml -e "COMP=dp CFG=dc1.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=bs CFG=dc1.cfg"

ansible-playbook -l n09 $OPS_HOME/edge-comp-setup.yml -e "COMP=bp CFG=dc1.cfg"

