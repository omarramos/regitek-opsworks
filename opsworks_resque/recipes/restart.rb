service 'resque' do
  action [:stop, :start, :restart]
  provider Chef::Provider::Service::Upstart
end
