class Location < ActiveRecord::Base
  mount_uploaders :images, ImageUploader
  
  searchkick
  
  has_many :reviews 
  
  validates :name, :address, presence: true
  validates :address, format: { with: /\d+[^,]+,[^,]+, [A-Z]{2,6} \d{4}/,
    message: "must be in the format; 123 Fake St, Melbourne, VIC 3058" }
end