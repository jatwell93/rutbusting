class PostAttachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :location
end
