default['e1']['ami'] = "ami-10206d42"
default['e1']['instance_type'] = "t1.micro"

default['e1']['placement']['region'] = 'ap-southeast-1'
default['e1']['placement']['az'] = 'ap-southeast-1a'

default['e1']['ebs']['size_GIG'] = 1
default['e1']['ebs']['mount_point'] = "/mnt/data_vol"
default['e1']['ebs']['device'] = "/dev/xvdl"
default['e1']['ebs']['fs'] = "ext4"

default['e1']['user'] = 'ubuntu'

default['e1']['www_root'] = "#{node['e1']['ebs']['mount_point']}/www"

default["nginx"]["user"] = "www-data"

