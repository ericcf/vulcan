require 'spec_helper'
require 'pages/user_session_pages/new'

feature 'Authentication' do

  let!(:user) { User.create(username: 'oscar', password: 'grouch', password_confirmation: 'grouch') }
  let(:login_page) { UserSessionPages::New.new(page) }

  background do
    login_page.visit
    login_page.username = 'oscar'
  end

  scenario 'successful user authentication' do
    login_page.password = 'grouch'
    home_page = login_page.sign_in
    home_page.alert('success').should eq('Signed in.')
  end

  scenario 'failed user authentication' do
    login_page.password = 'slimey'
    login_page.sign_in
    login_page.alert('error').should eq('Username or password did not match, please try again.')
  end
end
