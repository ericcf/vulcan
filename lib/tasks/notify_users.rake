namespace :notify_users do

  desc 'E-mail users a summary of closed tickets from previous day'
  task :latest_closed_tickets => :environment do
    User.each do |user|
      UserNotifications.latest_closed_tickets(user).deliver
    end
  end
end
