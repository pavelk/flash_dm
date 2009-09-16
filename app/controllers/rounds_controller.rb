class RoundsController < ApplicationController

  def index
    @rounds = Round.all( :conditions => 'date_till < now()' )
    
    respond_to do |format|
      format.xml  { render :xml => @rounds }
    end
  end
end
