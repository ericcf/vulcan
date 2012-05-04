require 'spec_helper'
require 'pages/project_pages/show'

feature 'Ticket creation' do

  include_context 'authentication helper'

  let(:project) { Project.create(title: 'Cooking') }

  background do
    sign_in
  end

  scenario 'from the project page' do
    project_page = ProjectPages::Show.new(page, id: project.id).visit
    new_ticket_page = project_page.add_ticket
    new_ticket_page.header.should eq('Add ticket to Cooking')
    new_ticket_page.title = 'Make an omelet'
    expect {
      new_ticket_page.save
    }.to change{project.tickets.count}.from(0).to(1)
    project_page.alert('success').should eq('Saved ticket.')
    project_page.ticket_titles.should eq(['Make an omelet'])
  end
end
