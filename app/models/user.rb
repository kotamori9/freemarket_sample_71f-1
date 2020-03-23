class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, length: { minimum: 7 }
  validates :birthday, presence: true
  validates :nickname, presence: true
  validates :last_name,:first_name,:last_name_furigana,:first_name_furigana, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください'}
  validates :credit_card, presence: true

  # has_many :items
  # has_many :comments
  has_one :address
end
