class Admin::GalleriesController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    if(params[:pagingSelector] == nil)
      params[:pagingSelector] = 50
    end
    @galleries = Gallery.search(params[:search], params[:order]).paginate :page => params[:page], :per_page => params[:pagingSelector]

    respond_to do |format|
      format.html
      format.xml  { render :xml => @galleries }
    end
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
  end
  
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Galerie byla upravena.'
        format.html { redirect_to(admin_galleries_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(admin_galleries_path) }
      format.xml  { head :ok }
    end
  end
  
end