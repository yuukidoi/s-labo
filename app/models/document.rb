class Document < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 40 }
  validates :goal, presence: true, length: { maximum: 150 }
  validates :explanation, length: { maximum: 250 }
  validates :preparation, length: { maximum: 150 }
  
   mount_uploader :file, UploadFileUploader
  
  has_many :favorites
  has_many :users, through: :favorites, source: :user
  has_many :comments
  has_many :comenter, through: :coments, source: :user
  
end
