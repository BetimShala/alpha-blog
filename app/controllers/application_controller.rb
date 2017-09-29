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

  def create_notification(action_by,action_to,action_type,action_map_url)
    Notification.create(action_by:action_by,user_id:action_to,action_type:action_type,action_map_url:action_map_url)
  end
end
