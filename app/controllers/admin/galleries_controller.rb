class Admin::GalleriesController < ApplicationController
  before_filter :check_authentication
  
  layout 'admin'
  
  def index
    @galleries = Gallery.all

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
  
end