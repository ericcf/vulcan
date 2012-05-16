require 'spec_helper'
require 'pages/project_pages/index'

feature 'Closed ticket list' do

  include_context 'authentication helper'

  background do
    project = Project.create(title: 'In process')
    project.tickets.create(title: 'done', user_id: 1, status: 'closed')
    sign_in
  end

  scenario 'view recent closed tickets' do
    projects_page = ProjectPages::Index.new(page).visit
    projects_page.closed_tickets.should eq(['done'])
  end
end
