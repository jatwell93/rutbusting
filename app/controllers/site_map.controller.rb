# app/controllers/sitemap_controller.rb
 
SitemapController < ApplicationController
  layout nil
  def index
    headers['Content-Type'] = 'application/xml'
    respond_to do |format|
      format.xml {@posts = Post.all}
    end
  end
end