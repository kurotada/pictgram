class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  
  def extension_whitelist
   %w(jpg jpeg png)
  end
  
  def size_range
   1..10.megabytes
  end


  
  
  
  belongs_to :user
  
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
end

