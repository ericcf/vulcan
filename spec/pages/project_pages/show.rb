require_relative '../page'
require_relative '../ticket_pages/new'

module ProjectPages

  class Show < Page

    def visit
      page.visit("/projects/#{options[:id]}")

      self
    end

    def add_ticket
      page.click_on('Add ticket')

      TicketPages::New.new(page, project_id: options[:id])
    end

    def close_ticket(title)
      page.find(:xpath, "//td[@class='title' and contains(., '#{title}')]/..").click_on('Close')
    end

    def reopen_ticket(title)
      page.find(:xpath, "//td[@class='title' and contains(., '#{title}')]/..").click_on('Reopen')
    end

    def title
      page.find('.title').text
    end

    def ticket_titles
      page.all('.ticket .title').map { |t| t.text }
    end

    def view_closed_tickets
      page.click_on('closed tickets')
    end
  end
end
