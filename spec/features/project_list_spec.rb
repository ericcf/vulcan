require 'spec_helper'
require 'pages/project_pages/index'

feature 'Projects page' do

  include_context 'authentication helper'

  background do
    zeta = Project.create(title: 'Zeta')
    zeta.tickets.create(title: 'last', user_id: 1)
    Project.create(title: 'Alpha')
    Project.create(title: 'Beta')
    sign_in
  end

  scenario 'view all projects in alphabetical order' do
    projects_page = ProjectPages::Index.new(page).visit
    projects_page.project_titles.should eq(['Alpha', 'Beta', 'Zeta 1'])
  end
end
