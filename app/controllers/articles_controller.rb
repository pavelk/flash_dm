class ArticlesController < ApplicationController
  
  def index_flash
     @articles = Article.all

      respond_to do |format|
        #format.html # index.html.erb
        format.xml  { render :xml => @articles.to_xml(:only => [ :id, :title, :perex, :data_file_name]) }
      end
  end
  
end