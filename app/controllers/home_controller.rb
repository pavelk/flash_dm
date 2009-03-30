class HomeController < ApplicationController
  
  def most_rated_gallery
    @gallery = Gallery.first(:order => 'rating_avg DESC')
    
    respond_to do |format|
        format.xml  { render :xml => @gallery.to_xml(:only => [ :id, :photo_file_name ]) }
    end
  end
  
  def most_rated_trip
    @trip = Travel.first(:order => 'rating_avg DESC')
    @photo = @trip.photos[0];
    
    respond_to do |format|
        format.xml  { render :xml => @photo.to_xml( :only => [ :id, :photo_file_name ]) }
    end
    
  end
  
  def popup_1
    render :layout => false 
  end
  
  def popup_2
    render :layout => false 
  end      
  
end
