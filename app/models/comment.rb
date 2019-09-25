class Comment < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :document, optional: true
  
  validates :content, presence: true, length: { maximum: 130 }
end
