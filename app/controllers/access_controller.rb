class AccessController < ApplicationController
  before_action :confirm_logged_in, except: [:login, :attemp_login, :logout]
  layout 'admin'

  def menu
  end

  def login
  end

  def attemp_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(username: params[:username]).first
      if found_user 
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Your are logged in."
      redirect_to admin_path
    else
      flash[:notice] = "Invalid username/password"
      redirect_to 'login'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to access_login_path
  end
end
