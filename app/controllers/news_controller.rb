class NewsController < ApplicationController

  def index_flash
     @news = New.all

      respond_to do |format|
        #format.html # index.html.erb
        format.xml  { render :xml => @news.to_xml(:only => [ :title, :perex, :photo_file_name]) }
      end
  end
end
