require_relative '../pages/user_session_pages/new'

shared_context 'authentication helper' do

  let!(:user) { User.create(username: 'admin', password: 'secret', password_confirmation: 'secret', email: 'foo@example.net') }

  def sign_in
    login_page = UserSessionPages::New.new(page).visit
    login_page.username = 'admin'
    login_page.password = 'secret'
    login_page.sign_in
  end
end
