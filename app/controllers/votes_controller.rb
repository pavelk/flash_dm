class VotesController < ApplicationController
  # GET /votes
  # GET /votes.xml
  def index
    @votes = Vote.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.xml
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
    end
  end
  
  def create_flash
    control = Vote.find( :first, :conditions => ["vote_ip = ? AND slogan_id =? AND round_id=?", request.env['REMOTE_ADDR'], params[:slogan_id], params[:round_id]] )
        
    if control.nil?
      vote = { :slogan_id => params[:slogan_id],
               :round_id => params[:round_id],
               :vote_ip => request.env['REMOTE_ADDR']   
            }
      @vote = Vote.new(vote)
      #update slogans set votes_count = 0 where id < 10000
      if @vote.save
        render :text => @vote.to_xml, :status => 200
      end
    else
        render :text => 'voted', :status => 200  
    end
  end  

  # GET /votes/new
  # GET /votes/new.xml
  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.xml
  def create
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        flash[:notice] = 'Vote was successfully created.'
        format.html { redirect_to(@vote) }
        format.xml  { render :xml => @vote, :status => :created, :location => @vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.xml
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        flash[:notice] = 'Vote was successfully updated.'
        format.html { redirect_to(@vote) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.xml
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to(votes_url) }
      format.xml  { head :ok }
    end
  end
end
