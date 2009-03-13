class UserSessionsController < ApplicationController
  
  def create
   user_session =  { :login => params[:login],             
                     :password => params[:password],
                     :remember_me => '1' }
   @user_session = UserSession.new(user_session)
   if @user_session.save
     render :xml => current_user.to_xml(:only => [ :id, :login, :email, :first_name, :last_name, :city ])
   else
     render :xml => @user_session.errors.to_xml
   end
  end
  
  def get_current_user
    if(current_user != nil)
      render :xml => current_user.to_xml
    else
      render :text => 'null'
      #render(:layout => false)
    end         
  end
  
  def destroy
   current_user_session.destroy
   render :text => 'logout'
   #render :nothing => true
  end
  
end
