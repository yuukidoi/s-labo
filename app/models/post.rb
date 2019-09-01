class Post < ApplicationRecord
  belongs_to :document
  mount_uploader :image, ImageUploader
end
