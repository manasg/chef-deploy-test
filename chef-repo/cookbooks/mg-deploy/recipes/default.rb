package "git"
package "openjdk-7-jdk"

deploy "simple" do
    deploy_to "/opt/apps"
    repository "https://github.com/manasg/chef-deploy-test"

    provider Chef::Provider::Deploy::Revision
end
