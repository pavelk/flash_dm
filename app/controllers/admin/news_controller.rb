class Admin::NewsController < ApplicationController
  
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    if(params[:pagingSelector] == nil)
      params[:pagingSelector] = 50
    end
    @news = New.all.paginate :page => params[:page], :per_page => params[:pagingSelector]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @news }
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
    @new = New.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @new }
    end
  end

  # GET /news/new
  # GET /news/new.xml
  def new
    @new = New.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new }
    end
  end

  # GET /news/1/edit
  def edit
    @new = New.find(params[:id])
  end

  # POST /news
  # POST /news.xml
  def create
    @new = New.new(params[:new])

    respond_to do |format|
      if @new.save
        flash[:notice] = 'New was successfully created.'
        #format.html { redirect_to(@new) }
        format.html { redirect_to(admin_news_index_path) }
        format.xml  { render :xml => @new, :status => :created, :location => @new }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @new.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_flash
    news = { :title => params[:title],
               :perex => params[:perex],
               #:active => 1,
               :description => params[:description] }
    @new = New.new(news)

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

  # PUT /news/1
  # PUT /news/1.xml
  def update
    @new = New.find(params[:id])

    respond_to do |format|
      if @new.update_attributes(params[:new])
        flash[:notice] = 'New was successfully updated.'
        format.html { redirect_to(admin_news_index_path) }
        #format.html { redirect_to(@new) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @new.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
    @new = New.find(params[:id])
    @new.destroy

    respond_to do |format|
      format.html { redirect_to(news_url) }
      format.xml  { head :ok }
    end
  end
end
