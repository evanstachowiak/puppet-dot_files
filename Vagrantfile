Vagrant::Config.run do |config|
  config.vm.box = 'lucid64'
  config.vm.box_url = 'http://files.vagrantup.com/lucid64.box'
  config.vm.network :hostonly, '10.10.10.10'

  #config.vm.provision :shell, :path => "bootstrap.bash"
  # Enable the Puppet provisioner
  #config.vm.provision :puppet do |puppet|
    #puppet.module_path = 'modules'
  #end
  config.vm.provision :shell, :inline => "apt-get install -y git-core" 
  config.vm.share_folder("v-root", "~/bootstrap/dot_files", ".", :nfs => true)
  #config.vm.provision :shell, :inline => "~/bootstrap/dot_files/bootstrap.bash" 

end
