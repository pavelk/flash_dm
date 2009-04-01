class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation
  
  private
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def check_authentication
      unless current_user && current_user.id == 1
        flash[:error] = "Nemáte oprávnění pro přístup na požadovanou stránku"
        redirect_to new_admin_user_session_path
        return false
      end  
    end
    
end
