class UserSessionsController < ApplicationController

  def new
    if @user = User.first(password_digest: cookies['digest'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back #{@user.username}!"
      redirect_to (session[:request_url] || root_url)
    else
      @user = User.new
    end
  end

  def create
    user = User.first(username: params[:user][:username])
    
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      if params[:remember_me] == "1"
        cookies["digest"] = { value: user.password_digest,
                              expires: Time.now + 4.weeks }
      else
        cookies["digest"] = nil
      end
      flash[:success] = 'Signed in.'
      redirect_to (session[:request_url] || root_url)
      session.delete :request_url
    else
      @user = User.new
      flash.now[:error] = 'Username or password did not match, please try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies["digest"] = nil
    flash[:success] = "Logged out!"
    redirect_to root_url
  end
end
