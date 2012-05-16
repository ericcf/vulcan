class UserNotifications < ActionMailer::Base
  def latest_closed_tickets(user)
    @tickets = user.tickets_in_date_range(Date.yesterday, Date.today)
    mail to: user.email
  end
end
