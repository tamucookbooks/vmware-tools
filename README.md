vmware-tools Cookbook
=====================
Installs VMWare Tools

Currently only tested on Ubuntu 12.04 and the binary install will only work with
Ubuntu.  The source install however should work on other distributions but is not
tested.

Requirements
------------

#### platforms
- `Ubuntu 12.04`
- `RHEL (CentOS,Oracle) 6.4`

#### cookbooks
- `ark` - used to download the source tar.gz file
- `apt` - used to add package repo for binary
- `yum` - used to add package repo for binary

Attributes
----------
#### vmware-tools::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['install_method']</tt></td>
    <td>String</td>
    <td>can be either binary or source</td>
    <td><tt>binary</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['version']</tt></td>
    <td>String</td>
    <td>the version of vmware to use (Binary only)</td>
    <td><tt>5.1</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['latest']</tt></td>
    <td>Boolean</td>
    <td>the install latest package version (Binary only)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['headless']</tt></td>
    <td>Boolean</td>
    <td>whether to just install headless tools (Binary only)</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['repo']</tt></td>
    <td>String</td>
    <td>the repository to use (Binary only)</td>
    <td><tt>http://packages.vmware.com/tools/esx/</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['repo_key']</tt></td>
    <td>String</td>
    <td>the repository key (Binary only)</td>
    <td><tt>http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['source_url']</tt></td>
    <td>String</td>
    <td>the url to pull the vmware tar.gz from (Source only)</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['vmware_tools']['installed']</tt></td>
    <td>Boolean</td>
    <td>whether the vmware tools are installed, gets set by source recipe(Source only)</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----
#### vmware-tools::source

```json
{
  "name":"my_node",
  "normal": {
    "vmware_tools": {
      "install_method": "source",
      "source_url": "http://mysourceurl.com/vmwaretools.tar.gz"
    }
  },
  "run_list": [
    "recipe[vmware-tools]"
  ]
}
```

#### vmware-tools::binary

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vmware-tools]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
License: MIT

Authors:

* Jim Rosser - jarosser06@tamu.edu
