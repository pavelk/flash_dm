class Admin::UserSessionsController < ApplicationController
  
  layout 'admin'
  
  def new
  #add_crumb('Login')  
   @user_session = UserSession.new
  end

  def create
   @user_session = UserSession.new(params[:user_session])
   if @user_session.save
     flash[:notice] = "Login successful!"
     #redirect_back_or_default home_url
     redirect_to(admin_users_path)
   else
     render :action => :new
   end
  end

  def destroy
   current_user_session.destroy
   flash[:notice] = "Logout successful!"
   redirect_back_or_default new_user_session_url
  end

end