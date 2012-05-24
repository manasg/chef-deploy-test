#Free!

package "git"

repo = '/opt/repo'

git repo do
    repository "https://github.com/manasg/chef-deploy-test"
    action :sync
    depth 5
    notifies :create, "ruby_block[a_block]"
    notifies :run, "execute[clean]"
    notifies :run, "execute[build]"
end

#build the dirty way!
app_name = "Simple"
deploy_dir = "/var/#{app_name}"
build_dir = "#{deploy_dir}/build"

directory deploy_dir

execute "build" do
    command "mkdir #{build_dir}; \
            javac #{repo}/code/*.java -d #{build_dir}"
    creates build_dir
    action :nothing
end

execute "clean" do
    command "rm -rf #{build_dir}"
    action :nothing
end


ruby_block "a_block" do
    block do
        Chef::Log.info("Hello! I was created")
    end
    action :nothing
end
