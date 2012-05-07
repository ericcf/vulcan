require_relative './ticket'

class TicketObserver

  include DataMapper::Observer

  observe Ticket

  before :valid? do
    self.user_id ||= User.current.id
  end
end
