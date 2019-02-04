app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

# ensure yum package cache is up-to-date
execute "yum check-update" do
  command "yum check-update"
  action :nothing
end

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end
