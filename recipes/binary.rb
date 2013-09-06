case node[:platform]
when 'ubuntu'
  apt_repository 'vmware_tools' do
    uri node[:vmware_tools][:base_url] + 'ubuntu' 
    distribution node[:lsb][:codename]
    if node[:machine] == 'x86_64'
      arch 'amd64'
    else
      arch node[:machine]
    end
    components ['main']
    key node[:vmware_tools][:repo_key]
  end
when 'centos'
  yum_repository 'vmware_tools' do
    description "vmware_tools repo"
    url node[:vmware_tools][:base_url] + "rhel#{node[:platform_version].to_i}/#{node[:kernel][:machine]}"
    key node[:vmware_tools][:repo_key]
    notifies :run, "execute[yum_refresh]", :immediately
  end
  execute "yum_refresh" do
    command "yum update"
#    action :nothing
  end
else
  Chef::Log.warning('Platform currently not supported by vmware-tools cookbook')
end
if node[:vmware_tools][:headless]
  package 'vmware-tools-esx-nox'
else
  package 'vmware-tools-esx'
end
