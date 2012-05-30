#
# Cookbook Name:: test-attributes
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.set['attrib'] = "default"
include_recipe "test-attributes::worker"
