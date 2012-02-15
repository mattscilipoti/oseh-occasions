class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    if member_id = session[:member_id]
      @member = Member.find(member_id)
    end
  end

  def logout
    session[:member_id] = nil
    redirect_to '/', :notice => "Logged out."
  end
end
