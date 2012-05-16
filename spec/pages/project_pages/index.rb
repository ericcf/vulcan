require_relative '../page'
require_relative 'new'

module ProjectPages

  class Index < Page

    class MainMenu
      def initialize(page)
        @page = page
      end

      def projects
        @page.all(:xpath, "//li[contains(./a, 'Projects')]/ul/li/a").map { |e| e.text }
      end
    end

    def visit
      page.visit '/'

      self
    end

    def project_titles
      page.all('.project .title').map { |t| t.text }
    end

    def closed_tickets
      page.all('.closed-ticket .title').map { |t| t.text }
    end

    def add_project
      page.click_on('Add project')

      New.new(page)
    end

    def main_menu
      MainMenu.new(page)
    end
  end
end
