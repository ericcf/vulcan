class UserNotifications < ActionMailer::Base
  default from: "from@example.com"

  def latest_closed_tickets(user)
    @tickets = user.tickets_in_date_range(Date.yesterday, Date.yesterday)
    mail to: user.email
  end
end
