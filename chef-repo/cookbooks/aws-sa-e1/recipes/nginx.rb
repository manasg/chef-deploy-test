package "nginx"

service "nginx" do
    action [:start, :enable]
    supports :status => true
end

link "/etc/nginx/sites-enabled/default" do
    action :delete
end

directory "/var/log/nginx" do
    mode "0655"
end

template "/etc/nginx/sites-available/aws-sa-e1" do
    source "nginx/aws-sa-e1.erb"
    mode "0640"

    notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/aws-sa-e1" do
    to  "/etc/nginx/sites-available/aws-sa-e1" 
end
