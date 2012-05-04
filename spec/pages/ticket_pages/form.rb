require_relative '../page'
require_relative '../project_pages/show'

module TicketPages

  class Form < Page

    def title=(value)
      page.fill_in('Title', with: value)
    end

    def save
      page.click_on('Save')
      
      ProjectPages::Show.new(page)
    end
  end
end
