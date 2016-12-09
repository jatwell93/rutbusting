class SitemapController < ApplicationController
  def show
   @locations = Location.all 
  end
end