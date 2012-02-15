class MembersController < ApplicationController
  def index
    member_query = params[:member_query]
    if member_query
      @filter = { :name => member_query }
      @members = Member.find_by_partial_name(member_query)
    else
      @members = Member.all
    end

    if member_query && @members.count == 1
      @member = @members.last
      session[:member_id] = @member.id
      redirect_to :back, :notice => "We found you! #{@member.first_name}"
    end
  end
end
