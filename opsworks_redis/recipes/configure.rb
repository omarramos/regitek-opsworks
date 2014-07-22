template '/etc/redis/redis.conf' do
  source "redis.conf.erb"
  mode "0755"
end