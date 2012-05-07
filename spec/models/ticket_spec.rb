require 'spec_helper'

describe Ticket do

  it 'should default to "open" status' do
    Ticket.create(user_id: 1).status.should eq('open')
  end
end
