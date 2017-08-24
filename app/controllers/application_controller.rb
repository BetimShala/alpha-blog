class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method i lejon qasje globale prej te gjithe views tjere
  helper_method :current_user,:logged_in?
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #return true or false based in current_user method return
    !!current_user
  end

  def require_user
   if !logged_in?
      flash[:danger]="You must be logged in to perform this action"
      redirect_to root_path
    end
    
  end
end
