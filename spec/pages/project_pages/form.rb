require_relative '../page'
require_relative 'show'

module ProjectPages

  class Form < Page

    def title=(value)
      page.fill_in('Title', with: value)
    end

    def save
      page.click_on('Save')
      
      Show.new(page)
    end
  end
end
