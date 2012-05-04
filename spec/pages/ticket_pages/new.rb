require_relative 'form'

module TicketPages

  class New < Form

    def header
      page.find('.page-header h2').text
    end
  end
end
