require 'spec_helper'

describe Ticket do

  it 'should default to "open" status' do
    Ticket.create.status.should eq('open')
  end
end
