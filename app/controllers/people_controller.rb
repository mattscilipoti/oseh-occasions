class PeopleController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @scopes = params[:q] || {}
    @people = Person.scoped
    @scopes.each do |scope, args|
      logger.debug("DBG: scoping Person: #{scope} => #{args}")
      @people = @people.send(scope, args)
    end

#    if @scopes && @people.size == 1
#      @person = @people.last
#      session[:person_id] = @person.id
#      redirect_to :back, :notice => "We found you, #{@person.first_name}!"
#    else
      respond_with @people
#    end
  end
end
