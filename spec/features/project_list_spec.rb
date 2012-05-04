require 'spec_helper'
require 'pages/project_pages/index'

feature 'Projects page' do

  include_context 'authentication helper'

  background do
    Project.create(title: 'Zeta')
    Project.create(title: 'Alpha')
    Project.create(title: 'Beta')
    sign_in
  end

  scenario 'view all projects in alphabetical order' do
    projects_page = ProjectPages::Index.new(page).visit
    projects_page.project_titles.should eq(['Alpha', 'Beta', 'Zeta'])
  end
end
