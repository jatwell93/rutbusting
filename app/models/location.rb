class Location < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  searchkick
  
  has_many :reviews 
  
  validates :name, :address, :image, presence: true
  validates :address, format: { with: /\A\S+[^,]+,[^,]+[a-zA-Z]{2,10} \d{2,6}\z/,
    message: "must be in the format; 123 Fake St, Melbourne VIC 3056 (Number + Street name + Type i.e St, Rd, Cr, Dr etc.), (Town or city + State QLD, NSW, NT etc. + Postcode" }
end