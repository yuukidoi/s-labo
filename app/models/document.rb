class Document < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 40 }
  validates :goal, presence: true, length: { maximum: 150 }
  validates :explanation, length: { maximum: 250 }
  validates :preparation, length: { maximum: 150 }
  validates :school, presence: true, length: { maximum: 10 }
  validates :grade, presence: true, length: { maximum: 10 }
  validates :subject, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 20 }
  
  
  
  
  
   mount_uploader :file, UploadFileUploader
   acts_as_taggable

  
  has_many :posts,dependent: :destroy
  accepts_nested_attributes_for :posts
  has_many :favorites,dependent: :destroy
  has_many :users, through: :favorites, source: :user,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :comenter, through: :coments, source: :user
  
end
