docroot = node['e1']['www_root']
www_usr = node['nginx']['user']

directory docroot do
    owner www_usr
    group www_usr
end


file "#{docroot}/index.html" do
    content "<h2> Hello AWS World </h2>"
    user www_usr
    group www_usr
    mode "0640"
end

cookbook_file "#{docroot}/screen-shot1.png" do
    source "screen-shot1.png"
    user www_usr
    group www_usr
    mode "0640"
end

cookbook_file "#{docroot}/screen-shot2.png" do
    source "screen-shot2.png"
    user www_usr
    group www_usr
    mode "0640"
end
