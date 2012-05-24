#Free!

package "openjdk-7-jdk"
package "git"

repo = '/opt/repo'

git repo do
    repository "https://github.com/manasg/chef-deploy-test"
    action :sync
end
