class SessionsController < ApplicationController
  def new
    if full_name = params[:person][:full_name]
      person = Person.find_by_full_name(full_name)
      session[:person_id] = person.id
    end
    redirect_to :back
  end
end