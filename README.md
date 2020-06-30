## Environment Set-up
VM1 - Ansible Host<br/>
VM2 - Target Machine / NGINX Gateway<br/>

VM1 - Checks
- Ensure you can 'ssh root@<ip_vm2>' without password
- Ensure you can 'ssh root@<ip_vm1>' without password on the same box
- Ensure you you have latest version of Ansible installed (2.9 or greater)
- Install relevant Roles for running the tasks / ansible-galaxy install <role_name>
    - nginxinc.nginx
    - nginxinc.nginx_controller_agent
    - nginxinc.nginx_controller_gateway
    - nginxinc.nginx_controller_generate_token
- Ensure you have cloned this repo
- Have .crt & .key for your N+ installation available

VM2 - Checks<br/>
- Ensure you make necessary changes in the /etc/ssh/sshd_conf file to enable remote log-in


## Steps - Install NGINX Plus

#### 1. cd into 'ansible' directory (where this repo is cloned) | cd /opt/ansible

#### 2. Ensure ansible is at latest version, 2.9 or above | ansible --version

#### 3. Update the inventory-hosts.yml file | sudo vi inventory-hosts.yml | localhost = vm1 & Target Machine = vm2
#####       - Make sure you have populated the hostname & ip-addresses
#####       - (Optionally, you can replace your /etc/ansible/hosts file with the contents of inventory-hosts.yml)

#### 4. Run the Pre Task for NGINX Install | ansible-playbook -i inventory-hosts.yml pretask-nginx-plus.yml
#####       - Ensure the output has no failures - This step replaces 'opensource' to 'plus' in the main.yml file for the role
#####       - Additionally, Validate if the path to ansible role is within the home directory of the user e.g. "/home/ubuntu/..."

#### 5. Copy .crt & .key to specific location | sudo cp nginx-repo* /home/ubuntu/.ansible/roles/nginxinc.nginx/files/license
#####       - Ensure by ls/cd to location that the files have successfully copied  

#### 6. Run the NGINX Plus Install | ansible-playbook -i inventory-hosts.yml install-nginx-plus.yml
#### 7. Verify by logging on to VM2 that NGINX Plus is installed and running   


## Steps - Install Controller Agent

### Finish Step 1, Step 2, Step 3 & Step 7 from the 'Install NGINX Plus' section

#### 1. Run the Pre Task for Controller Agent Install | ansible-playbook -i inventory-hosts.yml pretask-controller-agent.yml
#####       - Ensure the output has no failures
#####       - Additionally, Validate if the path to ansible role is within the home directory of the user e.g. "/home/ubuntu/..."

#### 2. Run Controller Agent Install | ansible-playbook -i inventory-hosts.yml install-controller-agent.yml -e "api_key=<api_key> nginx_controller_fqdn=<contorller_host> nginx_controller_location=<location> nginx_controller_instance_name=<name>"
### example: ansible-playbook install-controller-agent.yml -e "api_key=169dd026fcb005ba71eeec7238b6c7d2 nginx_controller_fqdn=controller3.westus.cloudapp.aws.com nginx_controller_location=unspecified nginx_controller_instance_name=$HOSTNAME"
#####       Ensure the output has no failures
    
#### 4. Verify by logging on to NGINX Controller that the Agent has registered in the location as provided 

## Steps - Create Gateway in NGINX Controller

##### Ensure all the steps in the above two sections have finished successfully

#### 1. In your NGINX Controller Dashboard - Create an environment. Capture the "Name" of the environmet. 

#### 2. In your 'ansible' directory, edit the create-controller-gateway.yml | sudo vi create-controller-gateway.yml
#####       - Ensure that all the values are updated approprately; username, password, controller-fqdn, environment-name and the agent-name in the instanceRefs tab. 

#### 3. Run Create Gateway task | ansible-playbook -i inventory-hosts.yml create-controller-gateway.yml
#####       - Ensure the output has no failures

#### 4. In your NGINX Controller Dashboard - Validate that a new Gateway has been created with your defined parameters

