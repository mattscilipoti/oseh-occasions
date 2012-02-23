class SessionsController < ApplicationController
  def new
    unless person_id = params[:person_id]
      person_args = params[:person]
      if person_args
        if person_args[:id]
          person_id = person_args[:id]
        else
          full_name = person_args[:full_name]
          person = Person.find_by_full_name(full_name)
          person_id = person.id
        end
      end
    end
    session[:person_id] = person_id
    redirect_to :back
  end
end
