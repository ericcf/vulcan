require_relative '../page'
require_relative 'new'

module ProjectPages

  class Index < Page

    def visit
      page.visit '/'

      self
    end

    def project_titles
      page.all('.project .title').map { |t| t.text }
    end

    def add_project
      page.click_on('Add project')

      New.new(page)
    end
  end
end
