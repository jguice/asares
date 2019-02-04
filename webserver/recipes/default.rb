app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end
