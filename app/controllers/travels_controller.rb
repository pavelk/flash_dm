class TravelsController < ApplicationController

  layout 'preview'

  def index
    @travels = Travel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @travels }
    end
  end
  
  def index_flash
    @travels = Travel.all(:order => 'rating_avg DESC, created_at DESC')

    respond_to do |format|
      #format.html # index.html.erb
      format.xml  { render :xml => @travels.to_xml(:include => [:user,:photos], :skip_types => false, :only => [ :id, :first_name, :last_name, :photo_file_name, :title, :description, :location, :duration, :difficulty, :created_at, :hits, :rating_count, :rating_total, :rating_avg ]) }
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
  
  def show_flash
    @travel = Travel.find(params[:id])
    @travel.hit!
    render :text => @travel.to_xml, :status => 200
  end  

  def new
    @travel = Travel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @travel }
    end
  end

  def edit
    @travel = Travel.find(params[:id])
  end


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
    travel = { :user_id => params[:user_id],
               :title => params[:title],
               :location => params[:location],
               :approved => 1,
               :active => 1,
               :rules_confirm => 1,
               :description => params[:description],
               :duration => params[:duration], 
               :difficulty => params[:difficulty] }
    @travel = Travel.new(travel)
    
    if @travel.save
      @photo = Photo.new(params[:photo])
      @travel.photos << @photo
      render :text => @travel.to_xml, :status => 200
    end
    #render
=begin    
    respond_to do |format|
      if @travel.save
        @photo = Photo.new(params[:photo])
        @travel.photos << @photo
        #format.html { redirect_to(root_path(:page => @travel.to_xml)) }
        format.html { render }
        #format.xml  { render :xml => @travel.to_xml, :status => :created, :location => @travel }
      else
        format.xml  { render :xml => @travel.errors }
      end
    end
=end    
  end
  
  def add_rating
    @travel = Travel.find(params[:id])
    @travel.rate(params[:rate_value].to_i)
        
    render :text => @travel.to_xml, :status => 200
  end
  
  def add_photo
    @travel = Travel.find(params[:id])
    @photo = Photo.new(params[:photo])
    @travel.photos << @photo
  
    render :text => @travel.to_xml, :status => 200
  end 


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

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    respond_to do |format|
      format.html { redirect_to(travels_url) }
      format.xml  { head :ok }
    end
  end
end
