class Post < ApplicationRecord
  belongs_to :document
  mount_uploader :image, ImageUploader
  
  validates :image_comment, length: { maximum: 120 }
end
