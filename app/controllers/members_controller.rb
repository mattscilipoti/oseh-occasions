class MembersController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @scopes = params[:q]
    @members = Member.scoped
    @scopes.each do |scope, args|
      logger.debug("DBG: scoping Member: #{scope} => #{args}")
      @members = @members.send(scope, args)
    end

    if @scopes && @members.count == 1
      @member = @members.last
      session[:member_id] = @member.id
      redirect_to :back, :notice => "We found you, #{@member.first_name}!"
    else
      respond_with @members
    end
  end
end
