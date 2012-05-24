#Free!

package "git"

repo = '/opt/repo'

git repo do
    repository "https://github.com/manasg/chef-deploy-test"
    action :sync
    depth 5
end
