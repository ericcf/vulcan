require 'spec_helper'

describe UserNotifications do

  describe 'latest_closed_tickets' do

    let(:user) { mock_model(User, email: 'foo@example.net') }
    let(:notifications) { UserNotifications.latest_closed_tickets(user) }
    let(:ticket) { mock_model(Ticket, title: 'Get a job') }

    before do
      user.stub!(:tickets_in_date_range).with(Date.yesterday, Date.yesterday) { [ticket] }
    end

    it 'should list closed tickets from yesterday' do
      notifications.body.encoded.should match('Get a job')
    end
  end
end
