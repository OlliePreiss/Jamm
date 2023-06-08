class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :matches
  has_many :messages
  # validates :about, length: { minimum: 10, maximum: 100 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
