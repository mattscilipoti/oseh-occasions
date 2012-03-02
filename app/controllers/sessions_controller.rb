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
          person_id = person && person.id
        end
      end
    end
    login(person_id)

    if current_person
      redirect_to root_path, :flash => {:success => "Shalom, #{current_person.first_name}"}
    else
      render :new, :alert => "Sorry, we couldn't find you.  Try again."
    end
  end

  def delete
    @current_person = nil
    session[:person_id] = nil
    redirect_to '/', :notice => "Logged out."
  end
end
