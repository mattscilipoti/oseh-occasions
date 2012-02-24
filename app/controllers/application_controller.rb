class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    if person_id = session[:person_id]
      @person = Person.find(person_id)
    end
  end

  def logout
    session[:person_id] = nil
    redirect_to '/', :notice => "Logged out."
  end

  private

  def login(person_id)
    session[:person_id] = person_id
  end
end
