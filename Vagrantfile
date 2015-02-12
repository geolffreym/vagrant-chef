# -*- mode: ruby -*-
# vi: set ft=ruby :
# Geolffrey Mena <gmjun2000@gmail.com>


nodes_config = JSON.parse(Pathname(__FILE__).dirname.join('config', 'nodes.json').read)['nodes']

VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = "vagrant-oracle-vm-saucy64"
  config.vm.box_url = "http://downloads.shadoware.org/wheezy64.box"

  nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node

    config.vm.define node_name do |config|
      # configures all forwarding ports in JSON array
      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port[':host'],
          guest: port[':guest'],
          id:    port[':id']
      end

      config.vm.hostname = node_values[':node']
      config.vm.network :private_network, ip: node_values[':ip']

      # syncs local repository of large third-party installer files (quicker than downloading each time)
      #config.vm.synced_folder "#{ENV['HOME']}/Documents/git_repos/chef-artifacts", "/vagrant"

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values[':memory']]
        vb.customize ["modifyvm", :id, "--name", node_values[':node']]
      end

     VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', node_name + '.json').read)

        config.vm.provision :chef_solo do |chef|
          chef.cookbooks_path = "cookbooks"
          chef.roles_path = "roles"
          chef.data_bags_path = "data_bags"
          chef.provisioning_path = "/tmp/vagrant-chef"

          chef.run_list = VAGRANT_JSON.delete('run_list')
          chef.json = VAGRANT_JSON
        end
    end
  end
end