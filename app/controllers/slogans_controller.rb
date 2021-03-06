class SlogansController < ApplicationController

  def index
    @round = Round.first( :conditions => 'date_from < now() AND date_till > now()')
    @slogans = @round.slogans

    respond_to do |format|

      format.xml  { render :xml => @slogans.to_xml( :include => [:round], :methods => [ :votes_total ], :skip_instruct => true, 
                    :only => [ :id, :round_id, :name, :username, :city, :votes_count, :date_from, :date_till ]) }              
    end
  end
  
  def get_round
    @slogans = Slogan.find( :all, :conditions => ["round_id = ?", params[:id]], :order => 'votes_count DESC' )
    respond_to do |format|
      format.xml  { render :xml => @slogans.to_xml( :skip_instruct => true, 
                    :only => [ :id, :round_id, :name, :username, :address, :votes_count ]) }              
    end
  end  

end