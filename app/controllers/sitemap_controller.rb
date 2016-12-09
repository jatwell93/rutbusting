# app/controllers/sitemap_controller.rb

SitemapController < ApplicationController
  layout nil
  def index
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml {@locaitons = Location.all}
    end
  end
end