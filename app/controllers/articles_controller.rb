class ArticlesController < ApplicationController
  
  def index_flash
     @articles = Article.all(:order => 'publish_date DESC')

      respond_to do |format|
        #format.html # index.html.erb
        format.xml  { render :xml => @articles.to_xml(:only => [ :id, :publish_date, :title, :perex, :data_file_name]) }
      end
  end
  
end