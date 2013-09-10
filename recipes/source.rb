package 'open-vm-tools' do
  action :purge
end

unless node[:vmware_tools][:installed]

  ark 'vmware_tools' do
    url node[:vmware_tools][:source_url]
    path '/tmp'
    action :put
  end

  execute 'install_vmware_tools' do
    action :run
    command '/tmp/vmware_tools/vmware-install.pl -d'
    notifies :run, 'ruby_block[set_vmware_tools_installed]', :immediately
  end

  ruby_block 'set_vmware_tools_installed' do
    block do
      node.set[:vmware_tools][:installed] = true
    end
    action :nothing
  end
end
