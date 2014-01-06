name             'font'
maintainer       'WhitePages IT Admin'
maintainer_email 'itadmin@whitepages.com'
license          'Apache 2.0'
description      'Installs/Configures fonts'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w{ debian ubuntu mac_os_x mac_os_x_server windows }.each do |os|
  supports os
end
