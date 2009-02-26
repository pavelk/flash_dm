class TravelsController < ApplicationController
  
  def add_photo
    @travel = Travel.find(params[:id])
    @photo = Photo.new(params[:photo])
    @travel.photos << @photo
  
    respond_to do |format|
      format.xml  { render :xml => @travel.to_xml(:include => [:user,:photos]), :status => :created, :location => @travel }
    end
  end
  
end  