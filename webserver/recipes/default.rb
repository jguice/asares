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
