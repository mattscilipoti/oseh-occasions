class PeopleController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @scopes = params[:q] || {}
    @persons = Person.scoped
    @scopes.each do |scope, args|
      logger.debug("DBG: scoping Person: #{scope} => #{args}")
      @persons = @persons.send(scope, args)
    end

#    if @scopes && @people.size == 1
#      @person = @people.last
#      session[:person_id] = @person.id
#      redirect_to :back, :notice => "We found you, #{@person.first_name}!"
#    else
      respond_with @persons
#    end
  end
end
