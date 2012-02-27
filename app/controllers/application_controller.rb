class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery
  helper_method :current_user


  def index
    if person_id = session[:person_id]
      @person = Person.find(person_id)
    end
  end

  def logout
    @current_user = nil
    session[:person_id] = nil
    redirect_to '/', :notice => "Logged out."
  end

  private

  def authenticate
    redirect_to new_session_path unless current_user
  end

  def current_user
    @current_user ||= (session[:person_id] && Person.find(session[:person_id]))
  end

  def login(person_id)
    session[:person_id] = person_id
  end
end
