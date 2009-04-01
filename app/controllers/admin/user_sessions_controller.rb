class Admin::UserSessionsController < ApplicationController
  #before_filter :check_authentication, :except => [:new, :create]
  
  layout 'admin'
  
  def new
  #add_crumb('Login')  
   @user_session = UserSession.new
  end

  def create
   @user_session = UserSession.new(params[:user_session])
   if @user_session.save
     flash[:notice] = "Úspěšné přihlášení!"
     #redirect_back_or_default home_url
     redirect_to(admin_users_path)
   else
     render :action => :new
   end
  end

  def destroy
   current_user_session.destroy
   flash[:notice] = "Úspěšné odhlášení!"
   redirect_to(new_admin_user_session_path)
  end

end