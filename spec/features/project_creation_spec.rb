require 'spec_helper'
require 'pages/project_pages/index'

feature 'Project creation' do

  include_context 'authentication helper'

  background do
    sign_in
  end

  scenario 'from the home page' do
    projects_page = ProjectPages::Index.new(page).visit
    new_project_page = projects_page.add_project
    new_project_page.title = 'Vulcan'
    project_page = nil
    expect {
      project_page = new_project_page.save
    }.to change{Project.count}.from(0).to(1)
    project_page.alert('success').should eq('Saved project.')
    project_page.title.should eq('Vulcan')
  end
end
