class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, length: { minimum: 7 }
  validates :birthday, presence: true
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_furigana, presence: true
  validates :first_name_furigana, presence: true
  validates :credit_card, presence: true
  # has_many :items
  # has_many :comments
  has_many :address
end
