class Admin::TravelsController < ApplicationController  

  layout 'admin'
  
  def index
    @travels = Travel.find(:all)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @travels }
    end
  end
  

  def show
    @travel = Travel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @travel }
    end
  end
  

  def edit
    @travel = Travel.find(params[:id])
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
