class Admin::UsersController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    if(params[:pagingSelector] == nil)
      params[:pagingSelector] = 50
    end  
    #@users = User.all(:order => params[:order]).paginate :page => params[:page], :per_page => params[:pagingSelector]
    @users = User.search(params[:search], params[:order]).paginate :page => params[:page], :per_page => params[:pagingSelector]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_path) }
      format.xml  { head :ok }
    end
  end
  
  
end  