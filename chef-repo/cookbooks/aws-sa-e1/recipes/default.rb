#
# Cookbook Name:: aws-sa-e1
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ebs_cred = data_bag_item("aws","credentials")['ebs']

#EBS
include_recipe "aws"

aws_ebs_volume "data_vol" do
    aws_access_key ebs_cred['access_key']
    aws_secret_access_key ebs_cred['secret_key']
    size node['e1']['ebs']['size_GIG'] 
    device node['e1']['ebs']['device'] 
    action [:create, :attach]
end

# FileSystem
#create file system if it doesn't exist
fs = node['e1']['ebs']['fs']
dev = node['e1']['ebs']['device']

bash "create_filesystem" do
    code <<-EOH
        echo "***** Will create #{fs} fs on #{dev} *****"
        echo 
    
        mkfs.#{fs} #{dev}
    EOH
    
    not_if "parted #{dev} print"
end

# mount it
usr = node['e1']['user']
directory node['e1']['ebs']['mount_point'] do
    owner usr
    group usr
    mode "0755"
    recursive true
end

mount node['e1']['ebs']['mount_point']  do
  device dev
  action [ :enable, :mount ]
  not_if "cat /proc/mounts |grep #{node['e1']['ebs']['mount_point']}"
end

# content
include_recipe "aws-sa-e1::content"

# Web server
include_recipe "aws-sa-e1::nginx"
