node[:deploy].each do |application, deploy|

  

  token = deploy[:hipchat_token]
  room = deploy[:hipchat_room_id]
  domain = deploy[:domains].first
  application_name = application

  Chef::Log.info("Notifying hipchat room of deploy")

  if deploy[:scm] and deploy[:deploying_user]
    scm = deploy[:scm]
    opsworks_user = deploy[:deploying_user]
  else
    scm = nil
    opsworks_user = nil
  end

  if deploy[:hipchat_run_on]
    perform_notification = deploy[:hipchat_run_on].include?(node['hostname'])
  else
    perform_notification = false
  end

  if token && room && application_name && perform_notification && !scm.nil? then
    execute "send hipchat notification" do
      command "/usr/bin/hipchat_notification.py #{token} #{room} #{application_name} #{opsworks_user} #{domain}"
      action :run
    end
  end
end
