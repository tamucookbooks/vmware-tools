if platform? 'ubuntu'
  apt_repository 'vmware_tools' do
    uri node['vmware_tools']['repo'] + 'ubuntu'
    distribution node['lsb']['codename']
    if node['machine'] == 'x86_64'
      arch 'amd64'
    else
      arch node['machine']
    end
    components ['main']
    key node['vmware_tools']['repo_key']
  end
elsif platform_family?('rhel')
  plat =  'rhel' + node['platform_version'].to_i.to_s
  yum_repository 'vmware_tools' do
    description 'vmware tools repository'
    baseurl URI.join(node['vmware_tools']['repo'], plat + '/',
                     node['kernel']['machine']).to_s
    gpgkey node['vmware_tools']['repo_key']
    metadata_expire '0'
    action :create
  end
end

if node['vmware_tools']['headless']
  package 'vmware-tools-esx-nox'
else
  package 'vmware-tools-esx'
end
