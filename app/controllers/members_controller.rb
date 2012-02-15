class MembersController < ApplicationController
  def search
    session[:member_id] = nil
    member_query = params[:member_query]
    @filter = { :name => member_query }
    @members = Member.find_by_partial_name(member_query)
    if @members.count == 1
      @member = @members.last
      session[:member_id] = @member.id
      redirect_to :back, :notice => "We found you! #{@member.first_name}"
    else
      render 'index'
    end
  end
end
