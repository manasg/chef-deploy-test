aws-sa-e1 Cookbook
==================

- Configures an EBS Volume 
- Attaches it to the node
- Creates FS
- Mounts it
- Installs and configures basic Nginx
- Nginx site is configured via template (See templates/)
- Serves hello! 

Requirements
------------
- Depends on AWS cookbook
- Databag called aws with an item credentials (See chef-deploy-test/chef-repo/data_bags/aws/). That should contain your AWS access/secret keys. It is not added to the git repo (obviously)

Attributes
----------
See : attributes/default.rb

Usage
-----

Just include `aws-sa-e1` in your node's `run_list`:

Entrypoint is recipes/default.rb

License and Authors
-------------------
Authors: Manas Gupta
