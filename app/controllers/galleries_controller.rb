class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.xml
  def index
    @galleries = Gallery.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  def index_flash
    @galleries = Gallery.all(:order => 'rating_total DESC, created_at DESC', :conditions => 'approved = 1')

    respond_to do |format|
      #format.html # index.html.erb
      format.xml  { render :xml => @galleries.to_xml }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        flash[:notice] = 'Gallery was successfully created.'
        format.html { redirect_to(@gallery) }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_flash
    #@gallery = Gallery.new(params[:gallery])

    gallery = { :user_id => params[:user_id],
                :city => params[:city],
                :author_name => params[:author_name],
                :author_age => params[:author_age],
                :photo => params[:gallery][:photo]
              }
    @gallery = Gallery.new(gallery)

    if @gallery.save
      render :text => @gallery.to_xml, :status => 200
    end
  end
  
  def add_rating
    @gallery = Gallery.find(params[:id])
    @gallery.rate(params[:rate_value].to_i)
        
    render :text => @gallery.to_xml, :status => 200
  end
  
  def show_flash
    @gallery = Gallery.find(params[:id])
    @gallery.hit!
    render :text => @gallery.to_xml, :status => 200
  end


  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery was successfully updated.'
        format.html { redirect_to(@gallery) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml

end
