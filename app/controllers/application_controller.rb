class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    if member_id = session[:member_id]
      @member = Member.find(member_id)
    end
  end
end
