require 'spec_helper'

describe TicketObserver do

  let(:mock_user) { mock_model(User) }
  let(:ticket) { Ticket.new(title: 'Run a 5k') }

  before do
    User.stub!(:current) { mock_user }
  end

  it 'should associate the authenticated user with the ticket' do
    ticket.should_receive(:user_id=).with(mock_user.id)
    ticket.save
  end
end
