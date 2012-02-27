class SessionsController < ApplicationController
  respond_to :html
  skip_filter :authenticate

  def new

  end

  def create
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
    login(person_id)
    if current_user
      redirect_to root_path, :notice => "Congratulations.  You are Logged In."
    else
      render :new, :alert => "Sorry, we couldn't find you.  Try again."
    end
  end
end
