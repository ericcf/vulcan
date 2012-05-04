require_relative '../page'

module UserSessionPages

  class New < Page

    def visit
      page.visit('/user_sessions/new')

      self
    end

    def username=(value)
      page.fill_in('Username', with: value)
    end

    def password=(value)
      page.fill_in('Password', with: value)
    end

    def sign_in
      page.click_on('Sign in')

      self
    end
  end
end
