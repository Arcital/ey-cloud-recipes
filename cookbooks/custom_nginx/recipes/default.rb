if ['app_master', 'app'].include?(node[:instance_role])
  remote_file "/etc/nginx/servers/domain_rewrites.conf" do
    source "domain_rewrites.conf"
    owner "root"
    group "root"
    mode "0644"
    backup 0
  end

  execute "nginx reload" do
    command "/etc/init.d/nginx reload"
  end
end
