#DO_BOX_URL = ""
#PRIVATE_KEY_PATH = ""
#TOKEN = ""

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/focal64"
    config.vm.network "forwarded_port", guest: 5000, host: 5002

    config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
    end

    #config.vm.provision "shell", inline: <<-SHELL
    #    sudo apt-get update
    #    sudo apt-get install -y python3-pip 
    #    python3 -m pip install -r /vagrant/requirements.txt
    #    export FLASK_APP=/vagrant/app.py
    #    python3 -m flask run --host=0.0.0.0
    #SHELL

    #config.vm.define "droplet-dhbw" do |droplet|
    #    override.ssh.private_key_path = PRIVATE_KEY_PATH
    #    override.vm.box = "digital_ocean"
    #    override.vm.box_url = DO_BOX_URL
    #    provider.token = TOKEN
    #    provider.image = "ubuntu-20-04-x64"
    #    provider.region = "fra1"
    #    provider.size = "512mb"
    #end

end
