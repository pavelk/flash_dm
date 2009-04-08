class Admin::TravelsController < ApplicationController  
  before_filter :check_authentication

  layout 'admin'
  
  def index
    if(params[:pagingSelector] == nil)
      params[:pagingSelector] = 50
    end
    @travels = Travel.all(:order => params[:order]).paginate :page => params[:page], :per_page => params[:pagingSelector]

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @travels }
    end
  end
  

  def remove_photo
    @travel = Travel.find(params[:id])
    @photo = Photo.find(params[:photo])
    @photo.destroy
    
    respond_to do |format|
      format.html { redirect_to(:controller => 'travels', :action => 'photos', :id => @travel) }
    end
  end
  

  def edit
    @travel = Travel.find(params[:id])
  end
  
  def update
    @travel = Travel.find(params[:id])

    respond_to do |format|
      if @travel.update_attributes(params[:travel])
        flash[:notice] = 'Výlet byl upraven.'
        format.html { redirect_to(admin_travels_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def photos
    @travel = Travel.find(params[:id])
    @photos = @travel.photos
  end
  
  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    respond_to do |format|
      format.html { redirect_to(admin_travels_path) }
      format.xml  { head :ok }
    end
  end

end
