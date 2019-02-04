app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

# ensure yum package cache is up-to-date
execute "yum check-update" do
  command "yum check-update"
  action :nothing
end

package 'httpd' do
  action :install
end

service 'httpd' do
  action [ :enable, :start ]
end

# remove default html dir
directory "/var/www/html" do
  recursive true
  action :delete
end

# mount our "data volume" as new html dir
mount '/var/www/html' do
  device '/dev/xvdb'
  fstype 'xfs'
  options 'rw'
  action [:mount, :enable]
end

# add custom index page to new mount
cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end
