class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :matches
  has_many :messages
  has_many :conversations, through: :messages

  has_one_attached :sampleurl
  # validates_attachment_content_type :song, :content_type => [ 'application/octet-stream', 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  validates :about, length: { minimum: 10, maximum: 100 }
  has_one_attached :photourl

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
