#Free!

package "git"

repo = '/opt/repo'

git repo do
    repository "https://github.com/manasg/chef-deploy-test"
    action :sync
    depth 5
    notifies :run, "execute[clean]"
    notifies :run, "execute[build]"
    notifies :run, "script[test]"
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

script "test" do
    interpreter "bash"

    code <<-END
        echo "Lets do some post install stuff" > /tmp/t
    END
    
    creates "/tmp/t"
    action :nothing
end
