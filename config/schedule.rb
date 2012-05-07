every 1.day, at: '12:01 am' do
  rake 'notify_users:latest_closed_tickets'
end
