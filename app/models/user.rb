class User < ApplicationRecord
  validates :name,presence: true
  validates :name,length: {maximum: 15}
  validates :email,presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password,length: {minimum: 8, maximum: 32}
  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
