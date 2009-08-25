class SlogansController < ApplicationController
  # GET /slogans
  # GET /slogans.xml
  def index
    @round = Round.first
    #@slogans = Slogan.find(:all, :conditions => 'round_id = 1')
    @slogans = @round.slogans

    respond_to do |format|
      #format.xml  { render :xml => @slogans.to_xml(:include => [:votes], :skip_instruct => true, 
      #              :only => [ :id, :round_id, :name, :username, :address ]) }
      format.xml  { render :xml => @slogans.to_xml( :include => [:round], :skip_instruct => true, 
                    :only => [ :id, :round_id, :name, :username, :address, :votes_count, :date_from, :date_till ]) }              
    end
  end
  
  def get_round
    @slogans = Slogan.find( :all, :conditions => ["round_id = ?", params[:id]], :order => 'votes_count DESC' )
    respond_to do |format|
      format.xml  { render :xml => @slogans.to_xml( :skip_instruct => true, 
                    :only => [ :id, :round_id, :name, :username, :address, :votes_count ]) }              
    end
  end  
  
  
  # GET /slogans/1
  # GET /slogans/1.xml
  def show
    @slogan = Slogan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slogan }
    end
  end

  # GET /slogans/new
  # GET /slogans/new.xml
  def new
    @slogan = Slogan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slogan }
    end
  end

  # GET /slogans/1/edit
  def edit
    @slogan = Slogan.find(params[:id])
  end

  # POST /slogans
  # POST /slogans.xml
  def create
    @slogan = Slogan.new(params[:slogan])

    respond_to do |format|
      if @slogan.save
        flash[:notice] = 'Slogan was successfully created.'
        format.html { redirect_to(@slogan) }
        format.xml  { render :xml => @slogan, :status => :created, :location => @slogan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slogan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slogans/1
  # PUT /slogans/1.xml
  def update
    @slogan = Slogan.find(params[:id])

    respond_to do |format|
      if @slogan.update_attributes(params[:slogan])
        flash[:notice] = 'Slogan was successfully updated.'
        format.html { redirect_to(@slogan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slogan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slogans/1
  # DELETE /slogans/1.xml
  def destroy
    @slogan = Slogan.find(params[:id])
    @slogan.destroy

    respond_to do |format|
      format.html { redirect_to(slogans_url) }
      format.xml  { head :ok }
    end
  end
end
