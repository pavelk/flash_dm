class UnsubscribesController < ApplicationController
  
  layout 'info'
  
  def unsubscribe
  end  
  
  def delete
    @unsubscribe = Unsubscribe.find(:first, :conditions => ["email = ?", "#{params[:email]}"])
    if(@unsubscribe.nil?)
      redirect_to ('/mailing-odhlaseni')
    else  
      @unsubscribe.update_attributes( :unsubscribe => '0' )
    end  
  end  

end
