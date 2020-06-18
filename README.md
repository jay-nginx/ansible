# ansible
ANSIBLE WORK
perquisites
1. Ansible package install
2. Password less ssh setup jumpbox and target hosts 
# Steps
#### 1. sudo ansible-galaxy install nginxinc.nginx
#### 2. sudo ansible-galaxy install nginxinc.nginx_controller_agent
#### 3. sudo git clone https://github.com/learnbyseven/ansible.git && cd ansible 

### 4. ng+ remote install, sample (Provide target hosts entry inside inventory-hosts.yml)
#### sudo ansible-playbook -i inventory-hosts.yml nginxplus-install-playbook.yaml

### 5.ctr agent install, sample (Use option -e for your enviornment specific variables) 
#### sudo ansible-playbook -i inventory-hosts.yml myagent-playbook.yml -e "api_key=abcdefg "
