default['vmware_tools']['install_method'] = 'binary'
default['vmware_tools']['version'] = '5.1'
default['vmware_tools']['latest'] = false
default['vmware_tools']['headless'] = true

if node['vmware_tools']['latest']
  package = node['vmware_tools']['version'] + 'latest'
else
  package = node['vmware_tools']['version']
end

# For binary packages
default['vmware_tools']['repo'] = "http://packages.vmware.com/tools/esx/#{package}/"
default['vmware_tools']['repo_key'] = 'http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub'

# For source packages
default['vmware_tools']['source_url']
default['vmware_tools']['installed'] = false
