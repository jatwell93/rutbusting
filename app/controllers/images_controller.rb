class ImagesController < ApplicationController
  before_action :set_gallery

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @location.save
    redirect_to :back
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:location_id])
  end

  def add_more_images(new_images)
    images = @location.images # copy the old images 
    images += new_images # concat old images with new ones
    @location.images = images # assign back
  end

  def images_params
    params.require(:location).permit({images: []}) # allow nested params as array
  end
end
