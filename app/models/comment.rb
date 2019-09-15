class Comment < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :document, optional: true
  
  validates :content, length: { maximum: 130 }
end
