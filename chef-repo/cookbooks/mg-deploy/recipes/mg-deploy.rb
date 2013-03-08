package "git"

deploy_root = "/opt/my-apps"
app_name = "app1"

directory deploy_root

repo = "https://github.com/manasg/chef-deploy-test"


deploy_revision app_name do
    repository repo
    deploy_to "#{deploy_root}/#{app_name}"
    
    migrate false
    symlinks({})
    symlink_before_migrate({})
    create_dirs_before_symlink []
end