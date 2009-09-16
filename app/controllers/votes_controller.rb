class VotesController < ApplicationController

  
  def create_flash
    control = Vote.find( :first, :conditions => ["vote_ip = ? AND slogan_id =? AND round_id=?", request.env['HTTP_X_FORWARDED_FOR'], params[:slogan_id], params[:round_id]] )
        
    if control.nil?
      vote = { :slogan_id => params[:slogan_id],
               :round_id => params[:round_id],
               #:vote_ip => request.env['REMOTE_ADDR']
               :vote_ip => request.env['HTTP_X_FORWARDED_FOR']  
            }
      @vote = Vote.new(vote)
      if @vote.save
        render :text => @vote.to_xml, :status => 200
      end
    else
        render :text => 'voted', :status => 200  
    end
  end  

end
