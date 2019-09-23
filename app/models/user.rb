class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length:{ maximum: 20}
    validates :email, presence: true, length:{ maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
                      
    mount_uploader :image, ImageUploader                  
    
    
    has_secure_password
    has_many :documents,dependent: :destroy
    
    has_many :favorites,dependent: :destroy
    has_many :likes, through: :favorites, source: :document
    has_many :comments,dependent: :destroy
    has_many :log, through: :comments, source: :document
    
    
    
    def like(document)
        unless self.documents == document
            self.favorites.find_or_create_by(document_id: document.id)
        end 
    end 
    
    def dislike(document)
        favorite = self.favorites.find_by(document_id: document.id)
        favorite.destroy if favorite
    end 
    
    def favorite?(document)
        self.likes.include?(document)
    end 
    
    def comment
       self.comments.create_by(document_id: document.id)
    end 
    
        
    
end
