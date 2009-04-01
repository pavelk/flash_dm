class Admin::UsersController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  
end  