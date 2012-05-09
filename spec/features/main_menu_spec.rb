require 'spec_helper'
require 'pages/project_pages/index'

feature 'Main menu' do

  background do
    avocado = Project.create(title: 'Avocado')
    avocado.tickets.create(title: 'foo', user_id: 1)
    broccoli = Project.create(title: 'Broccoli')
    broccoli.tickets.create(title: 'bar', status: 'closed', user_id: 1)
  end

  scenario 'view open ticket counts per project' do
    home_page = ProjectPages::Index.new(page).visit
    home_page.main_menu.projects.should eq(['Avocado 1', 'Broccoli'])
  end
end
