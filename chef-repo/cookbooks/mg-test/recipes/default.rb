#Free!

package "git"

repo = '/opt/repo'

git repo do
    repository "https://github.com/manasg/chef-deploy-test"
    action :sync
    depth 5
    notifies :create, "ruby_block[a_block]"
end

ruby_block "a_block" do
    block do
        log "I was created"
    end
    action :nothing
end
