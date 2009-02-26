class TravelsController < ApplicationController
  # GET /travels
  # GET /travels.xml
  def index
    @travels = Travel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @travels }
    end
  end

  # GET /travels/1
  # GET /travels/1.xml
  def show
    @travel = Travel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @travel.to_xml(:skip_instruct => true, :include => [:user, :photos],
                    :only => [ :title, :description, :duration, :difficulty, :login, :email,:photo_file_name ]) }
    end
  end

  # GET /travels/new
  # GET /travels/new.xml
  def new
    @travel = Travel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @travel }
    end
  end

  # GET /travels/1/edit
  def edit
    @travel = Travel.find(params[:id])
  end

  # POST /travels
  # POST /travels.xml
  def create
    @travel = Travel.new(params[:travel])

    respond_to do |format|
      if @travel.save
        flash[:notice] = 'Travel was successfully created.'
        format.html { redirect_to(@travel) }
        format.xml  { render :xml => @travel, :status => :created, :location => @travel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_flash
    travel = { :user_id => current_user.id,
               :title => params[:title], 
               :description => params[:description], 
               :duration => params[:duration], 
               :difficulty => params[:difficulty] }
    @travel = Travel.new(travel)
    
    respond_to do |format|
      if @travel.save
        format.xml  { render :xml => @travel.to_xml(:include => :user, :only => [ :title, :description, :duration, :difficulty, :login ]), :status => :created, :location => @travel }
      else
        format.xml  { render :xml => @travel.errors }
      end
    end
  end
  
  def add_photo
    @travel = Travel.find(params[:id])
    @photo = Photo.new(params[:photo])
    @travel.photos << @photo
  
    respond_to do |format|
      #format.html { redirect_to(@travel) }
      format.xml  { render :xml => @travel.to_xml(:include => [:user,:photos]), :status => :created, :location => @travel }
    end
  end 

  # PUT /travels/1
  # PUT /travels/1.xml
  def update
    @travel = Travel.find(params[:id])

    respond_to do |format|
      if @travel.update_attributes(params[:travel])
        flash[:notice] = 'Travel was successfully updated.'
        format.html { redirect_to(@travel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.xml
  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    respond_to do |format|
      format.html { redirect_to(travels_url) }
      format.xml  { head :ok }
    end
  end
end
