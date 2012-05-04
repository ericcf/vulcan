require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base
  use Rails::DataMapper::Middleware::IdentityMap
  protect_from_forgery

  helper_method :all_projects

  before_filter :set_current_user
  helper_method :current_user
  helper_method :user_signed_in?

  private

  def all_projects
    ProjectPresenter.wrap(Project)
  end

  def set_current_user
    User.current = current_user
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    ! current_user.nil?
  end

  def authenticate_user!
    unless user_signed_in?
      session[:request_url] = request.url
      flash[:warning] = 'You must sign in to access that page.'
      redirect_to new_user_session_url
    end
  end
end
