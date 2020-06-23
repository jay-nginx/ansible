# ansible
ANSIBLE WORK
perquisites
1. Ansible package install
2. Password less ssh setup jumpbox and target hosts 
3. Copy NGINXPlus cert&key (nginx-repo.crt & nginx-repo.key) at /root/.ansible/roles/nginxinc.nginx/files/license
4. ansible-galaxy install {nginxinc.nginx_controller_generate_token, nginxinc.nginx_controller_gateway,nginxinc.nginx}
# Steps
#### 1. sudo ansible-galaxy install nginxinc.nginx
#### 2. sudo ansible-galaxy install nginxinc.nginx_controller_agent
#### 3. sudo git clone https://github.com/learnbyseven/ansible.git && cd ansible 

### 4. ng+ remote install, sample (Provide target hosts entry inside inventory-hosts.yml)
#sudo ansible-playbook -i inventory-hosts.yml nginxplus-install-playbook.yml

Verify : systemctl status nginx

### 5.ctr agent install, sample (Use option -e for your enviornment specific variables) or define variables value inside ctr-agent-install-playbook.yml
#sudo ansible-playbook -i inventory-hosts.yml ctr-agent-install-playbook.yml -e "api_key=abcdefg123 nginx_controller_fqdn= cts.giri.local nginx_controller_location=india-east"

Verify : service controller-agent status

### 6. Remove Nginx-plus (Verify inventory-hosts.yml before play)
#sudo ansible-playbook -i inventory-hosts.yml uninstall-ctr-agent-playbook.yml
### 7. Remove controller-agent (Verify inventory-hosts.yml before play)
#sudo ansible-playbook -i inventory-hosts.yml remove-nginxplus-playbook.yaml
