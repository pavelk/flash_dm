class Admin::FriendsController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    @friends = Friend.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @friends }
    end
  end
  
end  
