Vagrant.configure("2") do |config|
  config.vm.box = "CentOS-6.4-i386-v20130731"
  
  config.vm.provider :virtualbox do |v, override|
    override.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130731.box"
    v.customize ["modifyvm", :id, "--memory", "256"]
  end

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "site.pp"
     puppet.module_path = "modules"
  end

  config.vm.define :hndata1 do |hndata1_config|
    hndata1_config.vm.network :private_network, ip: "192.168.2.12"
    hndata1_config.vm.hostname = 'HNData1.nature.com'
  end
  
  config.vm.define :hndata2 do |hndata2_config|
    hndata2_config.vm.network :private_network, ip: "192.168.2.13"
    hndata2_config.vm.hostname = 'HNData2.nature.com'
  end

  config.vm.define :master do |master_config|
    master_config.vm.network :private_network, ip: "192.168.2.10"
    master_config.vm.hostname = 'HNName.nature.com'
  end

end
