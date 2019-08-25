class Document < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 40 }
  validates :goal, presence: true, length: { maximum: 150 }
  validates :explanation, length: { maximum: 250 }
  validates :preparation, length: { maximum: 150 }
  
end
