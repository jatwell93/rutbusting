class SitemapController < ApplicationController
  def show
   @locations = Location.all 
  end
  
  def index
  end
end