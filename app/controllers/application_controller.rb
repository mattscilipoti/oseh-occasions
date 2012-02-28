class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user


  def index
    if person_id = session[:person_id]
      @person = Person.find(person_id)
    end
  end


  private

  def authenticate
    redirect_to(login_path, :notice => "Please login.") unless current_user
  end

  def current_user
    @current_user ||= (session[:person_id] && Person.find(session[:person_id]))
  end

  def login(person_id)
    session[:person_id] = person_id
  end
end
