require 'spec_helper'
require 'pages/project_pages/show'

feature 'Ticket status management' do

  include_context 'authentication helper'

  let(:project) { Project.create!(title: 'Kayaking') }
  let!(:ticket_a) { project.tickets.create(title: 'Get into kayak', user_id: User.last.id) }
  let!(:ticket_b) { project.tickets.create(title: 'Exit kayak', status: 'closed', user_id: User.last.id) }
  let(:project_page) { ProjectPages::Show.new(page, id: project.id).visit }

  background do
    sign_in
  end

  scenario 'close without javascript' do
    project_page.close_ticket('Get into kayak')
    Ticket.get(ticket_a.id).status.should eq('closed')
    project_page.alert('success').should eq('Closed ticket.')
    project_page.ticket_titles.should be_empty
  end

  scenario 'reopen' do
    project_page.view_closed_tickets
    project_page.reopen_ticket('Exit kayak')
    Ticket.get(ticket_b.id).status.should eq('open')
    project_page.alert('success').should eq('Reopened ticket.')
    project_page.ticket_titles.should eq(['Get into kayak', 'Exit kayak'])
  end
end
